classdef NodeVotlageMethod_exported < matlab.apps.AppBase

    % Properties that correspond to app components
    properties (Access = public)
        NodeVoltageMethodUIFigure       matlab.ui.Figure
        OutputPanel                     matlab.ui.container.Panel
        GridLayout                      matlab.ui.container.GridLayout
        UITable                         matlab.ui.control.Table
        TextArea                        matlab.ui.control.TextArea
        SetNodesNumberPanel             matlab.ui.container.Panel
        Nodesn1EditFieldLabel           matlab.ui.control.Label
        Nodesn1EditField                matlab.ui.control.NumericEditField
        ConfirmButton                   matlab.ui.control.Button
        AddComponentsTabGroup           matlab.ui.container.TabGroup
        CompButtonGroup                 matlab.ui.container.ButtonGroup
        ResistorButton                  matlab.ui.control.RadioButton
        CSButton                        matlab.ui.control.RadioButton
        VSButton                        matlab.ui.control.RadioButton
        Label                           matlab.ui.control.Label
        ALabel                          matlab.ui.control.Label
        VLabel                          matlab.ui.control.Label
        Node1EditFieldLabel             matlab.ui.control.Label
        Node1EditField                  matlab.ui.control.NumericEditField
        Node2EditFieldLabel             matlab.ui.control.Label
        Node2EditField                  matlab.ui.control.NumericEditField
        ValueEditFieldLabel             matlab.ui.control.Label
        ValueEditField                  matlab.ui.control.NumericEditField
        AddButton                       matlab.ui.control.Button
        CalculateButton                 matlab.ui.control.Button
        CPTab                           matlab.ui.container.Tab
        ControledCPTab                  matlab.ui.container.Tab
        SourceButtonGroup          matlab.ui.container.ButtonGroup
        CCCSButton                 matlab.ui.control.RadioButton
        VCCSButton                 matlab.ui.control.RadioButton
        CCVSButton                 matlab.ui.control.RadioButton
        VVVSButton                 matlab.ui.control.RadioButton
        ControlPortEditFieldLabel  matlab.ui.control.Label
        ControlPortEditField       matlab.ui.control.NumericEditField
        ControlPortEditField_2     matlab.ui.control.NumericEditField
        ParameterEditFieldLabel    matlab.ui.control.Label
        ParameterEditField         matlab.ui.control.NumericEditField
        AddButton_2                matlab.ui.control.Button
        NodesPortEditFieldLabel    matlab.ui.control.Label
        NodesPortEditField         matlab.ui.control.NumericEditField
        NodesPortEditField_2       matlab.ui.control.NumericEditField
    end

    
    properties (Access = private)
        A=[] % Matrix A
        b=[] % Matrix b
        textValue = '';
        components=cell(0);
        cpNum=0;            %元件总数
        nodeNum=0;          %结点总数
        %saveVSNum=0;        %具有的电压源数
    end
    

    % Callbacks that handle component events
    methods (Access = private)

        % Button pushed function: ConfirmButton
        function ConfirmButtonPushed(app, event)
            %获取结点数
            app.nodeNum=app.Nodesn1EditField.Value;
            
            %文字提示
            app.TextArea.Value = strcat(app.textValue,'添加待解电路的结点数为 ',num2str(app.Nodesn1EditField.Value),' ；');
            
            %保存窗口内已有的文字
            app.textValue = app.TextArea.Value;
            
        end

        % Button pushed function: AddButton
        function AddButtonPushed(app, event)
            % app.components 
            
            %添加按钮
            
            %元件名、结点1、结点2、值
            seletctedCompText = app.CompButtonGroup.SelectedObject.Text;
            no1=app.Node1EditField.Value;
            no2=app.Node2EditField.Value;
            compValue=app.ValueEditField.Value;
            
            %保存到components
            saveComp=app.components;
            app.components=[saveComp;{seletctedCompText,no1,no2,compValue,0,0}];
            saveLog = strcat('添加元件 ',seletctedCompText,' ；');
            
            %元件数目+1
            app.cpNum=app.cpNum+1;
            
%             if seletctedCompText== "VS"
%                 %电流源+1
%                 app.saveVSNum=app.saveVSNum+1;
%             end
            
            %表格添加
            app.UITable.Data=[app.UITable.Data;{seletctedCompText,no1,no2,compValue,0,0}];
            %文字说明
            app.TextArea.Value=[saveLog;app.textValue];
            app.textValue = app.TextArea.Value;
            
        end
        
        
        % 添加控制源
        % Button pushed function: AddButton_2
        function AddButton_2Pushed(app, event)
            seletctedCompText = app.SourceButtonGroup.SelectedObject.Text;
            nodePort1=app.NodesPortEditField.Value;
            nodePort2=app.NodesPortEditField_2.Value;
            controlPort1=app.ControlPortEditField.Value;
            controlPort2=app.ControlPortEditField_2.Value;
            csValue=app.ParameterEditField.Value;
            
            %保存到components
            saveComp=app.components;
            app.components=[saveComp;{seletctedCompText,nodePort1,nodePort2,csValue,controlPort1,controlPort2}];
            saveLog = strcat('添加受控元件 ',seletctedCompText,' ；');
            
            %元件数目+1
            app.cpNum=app.cpNum+1;
            
            %表格添加
            app.UITable.Data=[app.UITable.Data;{seletctedCompText,nodePort1,nodePort2,csValue,controlPort1,controlPort2}];
            %文字说明
            app.TextArea.Value=[saveLog;app.textValue];
            app.textValue = app.TextArea.Value;
            
        end

        % Button pushed function: CalculateButton
        function CalculateButtonPushed(app, event)      
            %计算按钮
            
            %收集表格数据
            takeCpInfs=app.UITable.Data;
            
%             调试
%             takeCpInfs={'Rs',0,2,2,0,0;'Rs',1,2,1,0,0;'Rs',1,3,3,0,0;'CS',0,1,1,0,0;'VS',3,0,12,0,0;'VCCS',2,3,0.5,1,0};
%             app.cpNum=6;
           
            AA = zeros(app.nodeNum+1);
            bb = zeros(app.nodeNum+1,1);
            
            %默认未知数为1
            VSNum=1; 
            %nodeNum 等于矩阵维数
            nodeNums = app.nodeNum + 1;
            
            
            for i=1:app.cpNum
                cpName=string(char(takeCpInfs(i,1)));
                cpNo1=int8(cell2mat(takeCpInfs(i,2))+1);
                cpNo2=int8(cell2mat(takeCpInfs(i,3))+1);    
                cpPort1=int8(cell2mat(takeCpInfs(i,5))+1);
                cpPort2=int8(cell2mat(takeCpInfs(i,6))+1); 
                cpValue=cell2mat(takeCpInfs(i,4));               
                
                switch char(cpName)
                    case 'Rs'
                        AA(cpNo1,cpNo1)= AA(cpNo1,cpNo1)+1/cpValue;
                        AA(cpNo1,cpNo2)= AA(cpNo1,cpNo2)-1/cpValue;
                        AA(cpNo2,cpNo1)= AA(cpNo2,cpNo1)-1/cpValue;
                        AA(cpNo2,cpNo2)= AA(cpNo2,cpNo2)+1/cpValue;          
                            
                    case 'CS'
                        bb(cpNo1)=bb(cpNo1)-cpValue;
                        bb(cpNo2)=bb(cpNo2)+cpValue;
                        
                    case 'VS'
                        %扩展矩阵
                        AA(nodeNums+VSNum,nodeNums+VSNum)= 0;
                        bb(nodeNums+VSNum)=0;
                        
                        AA(cpNo1,nodeNums+VSNum)= AA(cpNo1,nodeNums+VSNum) + 1;
                        AA(cpNo2,nodeNums+VSNum)= AA(cpNo2,nodeNums+VSNum) - 1;
                        AA(nodeNums+VSNum,cpNo1)= AA(nodeNums+VSNum,cpNo1) + 1;
                        AA(nodeNums+VSNum,cpNo2)= AA(nodeNums+VSNum,cpNo2) - 1;
                        bb(nodeNums+VSNum)=bb(nodeNums+VSNum)+cpValue;
                        VSNum=VSNum+1;
                        
                    case 'VCCS'        
                        AA(cpNo1,cpPort1)= AA(cpNo1,cpPort1) + cpValue;
                        AA(cpNo1,cpPort2)= AA(cpNo1,cpPort2) - cpValue;
                        AA(cpNo2,cpPort1)= AA(cpNo2,cpPort1) - cpValue;
                        AA(cpNo2,cpPort2)= AA(cpNo2,cpPort2) + cpValue;
                        
                    case 'VCVS'
                        AA(nodeNums+VSNum,nodeNums+VSNum)= 0;
                        bb(nodeNums+VSNum)=0;
                        
                        AA(cpNo1,nodeNums+VSNum)= AA(cpNo1,nodeNums+VSNum) + 1;
                        AA(cpNo2,nodeNums+VSNum)= AA(cpNo2,nodeNums+VSNum) - 1;
                        AA(nodeNums+VSNum,cpNo1)= AA(nodeNums+VSNum,cpNo1) + 1;
                        AA(nodeNums+VSNum,cpNo2)= AA(nodeNums+VSNum,cpNo2) - 1;
                        
                        AA(cpNo1,cpPort1)= AA(cpNo1,cpPort1) - cpValue;
                        AA(cpNo1,cpPort2)= AA(cpNo1,cpPort2) + cpValue;
                        
                        VSNum=VSNum+1;
                        
                    case 'CCCS'
                        AA(nodeNums+VSNum,nodeNums+VSNum)= 0;
                        bb(nodeNums+VSNum)=0;
                        
                        AA(cpNo1,nodeNums+VSNum)= AA(cpNo1,nodeNums+VSNum) + cpValue;
                        AA(cpNo2,nodeNums+VSNum)= AA(cpNo2,nodeNums+VSNum) - cpValue;
                        
                        VSNum=VSNum+1;
                        
                    case 'CCVS'
                        m=nodeNums+VSNum;
                        k=nodeNums+VSNum+1;
                        AA(k,k)= 0;
                        bb(nodeNums+VSNum+1)=0;
                        
                        AA(cpNo1,m)= AA(cpNo1,m) + 1;
                        AA(cpNo2,m)= AA(cpNo2,m) - 1;
                        AA(m,cpNo1)= AA(m,cpNo1) + 1;
                        AA(m,cpNo2)= AA(m,cpNo2) - 1;
                        AA(m,k)=AA(m,k)-cpValue;
                        
                        VSNum=VSNum+2;
                end
                
            end
            AA(1,:)=[];
            AA(:,1)=[];
            bb(1)=[];
%             AA
%             bb

            x=pinv(AA)*bb;

            app.TextArea.Value=[join(string(x),",");app.textValue];
%             x(3)-x(1)
        end
    end

    % Component initialization
    methods (Access = private)

        % Create UIFigure and components
        function createComponents(app)

            % Create NodeVoltageMethodUIFigure and hide until all components are created
            app.NodeVoltageMethodUIFigure = uifigure('Visible', 'off');
            app.NodeVoltageMethodUIFigure.Position = [100 100 534 347];
            app.NodeVoltageMethodUIFigure.Name = 'NodeVoltageMethod';

            % Create OutputPanel
            app.OutputPanel = uipanel(app.NodeVoltageMethodUIFigure);
            app.OutputPanel.Title = 'Output';
            app.OutputPanel.Position = [13 11 259 327];

            % Create GridLayout
            app.GridLayout = uigridlayout(app.OutputPanel);
            app.GridLayout.ColumnWidth = {'1x'};
            app.GridLayout.RowHeight = {'1x', '1.5x'};

            % Create UITable
            app.UITable = uitable(app.GridLayout);
            app.UITable.ColumnName = {'Comp'; 'No1'; 'No2'; 'Value';'CP1';'CP2'};
            app.UITable.ColumnWidth = {60, 49, 49, 60,'auto','auto'};
            app.UITable.RowName = {};
            app.UITable.Layout.Row = 2;
            app.UITable.Layout.Column = 1;
            app.UITable.ColumnEditable = true;

            % Create TextArea
            app.TextArea = uitextarea(app.GridLayout);
            app.TextArea.Editable = 'off';
            app.TextArea.Layout.Row = 1;
            app.TextArea.Layout.Column = 1;

            % Create SetNodesNumberPanel
            app.SetNodesNumberPanel = uipanel(app.NodeVoltageMethodUIFigure);
            app.SetNodesNumberPanel.Title = 'Set Nodes Number';
            app.SetNodesNumberPanel.Position = [279 259 245 79];

            % Create Nodesn1EditFieldLabel
            app.Nodesn1EditFieldLabel = uilabel(app.SetNodesNumberPanel);
            app.Nodesn1EditFieldLabel.HorizontalAlignment = 'right';
            app.Nodesn1EditFieldLabel.Position = [9 19 72 22];
            app.Nodesn1EditFieldLabel.Text = 'Nodes (n):';

            % Create Nodesn1EditField
            app.Nodesn1EditField = uieditfield(app.SetNodesNumberPanel, 'numeric');
            app.Nodesn1EditField.HorizontalAlignment = 'center';
            app.Nodesn1EditField.Position = [91 15 52 30];

            % Create ConfirmButton
            app.ConfirmButton = uibutton(app.SetNodesNumberPanel, 'push');
            app.ConfirmButton.ButtonPushedFcn = createCallbackFcn(app, @ConfirmButtonPushed, true);
            app.ConfirmButton.Position = [155 11 78 38];
            app.ConfirmButton.Text = 'Confirm';

            % Create AddComponentsTabGroup
            app.AddComponentsTabGroup = uitabgroup(app.NodeVoltageMethodUIFigure);
            %app.AddComponentsTabGroup.Title = 'Add Components (Node1 to Node2)';
            app.AddComponentsTabGroup.Position = [279 61 245 189];
            
            %create tabs
            % Create Tab
            app.CPTab = uitab(app.AddComponentsTabGroup);
            app.CPTab.Title = 'CP';

            % Create ControledCPTab
            app.ControledCPTab = uitab(app.AddComponentsTabGroup);
            app.ControledCPTab.Title = 'Controled CP';
            

            % Create CompButtonGroup
            app.CompButtonGroup = uibuttongroup(app.CPTab);
            app.CompButtonGroup.Title = 'Comp';
            app.CompButtonGroup.Position = [9 56 105 106];

            % Create ResistorButton
            app.ResistorButton = uiradiobutton(app.CompButtonGroup);
            app.ResistorButton.Text = 'Rs';
            app.ResistorButton.Position = [11 60 66 22];
            app.ResistorButton.Value = true;

            % Create CSButton
            app.CSButton = uiradiobutton(app.CompButtonGroup);
            app.CSButton.Text = 'CS';
            app.CSButton.Position = [11 38 38 22];

            % Create VSButton
            app.VSButton = uiradiobutton(app.CompButtonGroup);
            app.VSButton.Text = 'VS';
            app.VSButton.Position = [11 16 37 22];

            % Create Label
            app.Label = uilabel(app.CompButtonGroup);
            app.Label.Position = [75 60 25 22];
            app.Label.Text = ' / 欧';

            % Create ALabel
            app.ALabel = uilabel(app.CompButtonGroup);
            app.ALabel.Position = [75 39 25 22];
            app.ALabel.Text = ' / A';

            % Create VLabel
            app.VLabel = uilabel(app.CompButtonGroup);
            app.VLabel.Position = [75 16 25 22];
            app.VLabel.Text = ' / V';

            % Create Node1EditFieldLabel
            app.Node1EditFieldLabel = uilabel(app.CPTab);
            app.Node1EditFieldLabel.HorizontalAlignment = 'right';
            app.Node1EditFieldLabel.Position = [129 125 41 22];
            app.Node1EditFieldLabel.Text = 'Node1';

            % Create Node1EditField
            app.Node1EditField = uieditfield(app.CPTab, 'numeric');
            app.Node1EditField.HorizontalAlignment = 'center';
            app.Node1EditField.Position = [196 125 37 22];

            % Create Node2EditFieldLabel
            app.Node2EditFieldLabel = uilabel(app.CPTab);
            app.Node2EditFieldLabel.HorizontalAlignment = 'right';
            app.Node2EditFieldLabel.Position = [129 95 41 22];
            app.Node2EditFieldLabel.Text = 'Node2';

            % Create Node2EditField
            app.Node2EditField = uieditfield(app.CPTab, 'numeric');
            app.Node2EditField.HorizontalAlignment = 'center';
            app.Node2EditField.Position = [196 95 37 22];

            % Create ValueEditFieldLabel
            app.ValueEditFieldLabel = uilabel(app.CPTab);
            app.ValueEditFieldLabel.HorizontalAlignment = 'right';
            app.ValueEditFieldLabel.Position = [133 65 34 22];
            app.ValueEditFieldLabel.Text = 'Value';

            % Create ValueEditField
            app.ValueEditField = uieditfield(app.CPTab, 'numeric');
            app.ValueEditField.HorizontalAlignment = 'center';
            app.ValueEditField.Position = [196 65 37 22];

            % Create AddButton
            app.AddButton = uibutton(app.CPTab, 'push');
            app.AddButton.ButtonPushedFcn = createCallbackFcn(app, @AddButtonPushed, true);
            app.AddButton.Position = [10 11 223 38];
            app.AddButton.Text = 'Add';

            % Create CalculateButton
            app.CalculateButton = uibutton(app.NodeVoltageMethodUIFigure, 'push');
            app.CalculateButton.ButtonPushedFcn = createCallbackFcn(app, @CalculateButtonPushed, true);
            app.CalculateButton.Position = [289 11 223 38];
            app.CalculateButton.Text = 'Calculate';
            
            
            %-----------Table2---------------
            
            % Create SourceButtonGroup
            app.SourceButtonGroup = uibuttongroup(app.ControledCPTab);
            app.SourceButtonGroup.Title = 'Source';
            app.SourceButtonGroup.Position = [11 37 120 119];

            % Create CCCSButton
            app.CCCSButton = uiradiobutton(app.SourceButtonGroup);
            app.CCCSButton.Text = 'CCCS';
            app.CCCSButton.Position = [11 73 56 22];
            app.CCCSButton.Value = true;

            % Create VCCSButton
            app.VCCSButton = uiradiobutton(app.SourceButtonGroup);
            app.VCCSButton.Text = 'VCCS';
            app.VCCSButton.Position = [11 51 54 22];

            % Create CCVSButton
            app.CCVSButton = uiradiobutton(app.SourceButtonGroup);
            app.CCVSButton.Text = 'CCVS';
            app.CCVSButton.Position = [11 29 54 22];

            % Create VVVSButton
            app.VVVSButton = uiradiobutton(app.SourceButtonGroup);
            app.VVVSButton.Text = 'VVVS';
            app.VVVSButton.Position = [11 8 52 22];

            % Create ControlPortEditFieldLabel
            app.ControlPortEditFieldLabel = uilabel(app.ControledCPTab);
            app.ControlPortEditFieldLabel.HorizontalAlignment = 'right';
            app.ControlPortEditFieldLabel.Position = [149 101 82 22];
            app.ControlPortEditFieldLabel.Text = 'Control - Port ';

            % Create ControlPortEditField
            app.ControlPortEditField = uieditfield(app.ControledCPTab, 'numeric');
            app.ControlPortEditField.HorizontalAlignment = 'center';
            app.ControlPortEditField.Position = [158 80 35 22];

            % Create NodesPortEditFieldLabel
            app.NodesPortEditFieldLabel = uilabel(app.ControledCPTab);
            app.NodesPortEditFieldLabel.HorizontalAlignment = 'right';
            app.NodesPortEditFieldLabel.Position = [153 142 74 22];
            app.NodesPortEditFieldLabel.Text = 'Nodes - Port';

            % Create NodesPortEditField
            app.NodesPortEditField = uieditfield(app.ControledCPTab, 'numeric');
            app.NodesPortEditField.HorizontalAlignment = 'center';
            app.NodesPortEditField.Position = [158 121 35 22];

            % Create NodesPortEditField_2
            app.NodesPortEditField_2 = uieditfield(app.ControledCPTab, 'numeric');
            app.NodesPortEditField_2.HorizontalAlignment = 'center';
            app.NodesPortEditField_2.Position = [197 121 35 22];

            % Create ControlPortEditField_2
            app.ControlPortEditField_2 = uieditfield(app.ControledCPTab, 'numeric');
            app.ControlPortEditField_2.HorizontalAlignment = 'center';
            app.ControlPortEditField_2.Position = [197 80 35 22];

            % Create ParameterEditFieldLabel
            app.ParameterEditFieldLabel = uilabel(app.ControledCPTab);
            app.ParameterEditFieldLabel.HorizontalAlignment = 'right';
            app.ParameterEditFieldLabel.Position = [149 60 61 22];
            app.ParameterEditFieldLabel.Text = 'Parameter';

            % Create ParameterEditField
            app.ParameterEditField = uieditfield(app.ControledCPTab, 'numeric');
            app.ParameterEditField.HorizontalAlignment = 'center';
            app.ParameterEditField.Position = [158 39 74 22];

            % Create AddButton_2
            app.AddButton_2 = uibutton(app.ControledCPTab, 'push');
            app.AddButton_2.ButtonPushedFcn = createCallbackFcn(app, @AddButton_2Pushed, true);
            app.AddButton_2.Text = 'Add';
            app.AddButton_2.Position = [11 7 220 26];

            % Show the figure after all components are created
            app.NodeVoltageMethodUIFigure.Visible = 'on';
        end
    end

    % App creation and deletion
    methods (Access = public)

        % Construct app
        function app = NodeVotlageMethod_exported

            % Create UIFigure and components
            createComponents(app)

            % Register the app with App Designer
            registerApp(app, app.NodeVoltageMethodUIFigure)

            if nargout == 0
                clear app
            end
        end

        % Code that executes before app deletion
        function delete(app)

            % Delete UIFigure when app is deleted
            delete(app.NodeVoltageMethodUIFigure)
        end
    end
end
classdef circuit_exported < matlab.apps.AppBase

    % Properties that correspond to app components
    properties (Access = public)
        UIFigure               matlab.ui.Figure
        Menu                   matlab.ui.container.Menu
        Menu_2                 matlab.ui.container.Menu
        Menu_3                 matlab.ui.container.Menu
        Menu_4                 matlab.ui.container.Menu
        poweredat20191219Menu  matlab.ui.container.Menu
        LazeVitaMenu           matlab.ui.container.Menu
        GalileoGalileocnMenu   matlab.ui.container.Menu
        Panel                  matlab.ui.container.Panel
        ButtonGroup            matlab.ui.container.ButtonGroup
        Button                 matlab.ui.control.ToggleButton
        Button_2               matlab.ui.control.ToggleButton
        Button_3               matlab.ui.control.ToggleButton
        Button_4               matlab.ui.control.ToggleButton
        Button_6               matlab.ui.control.ToggleButton
        TabGroup               matlab.ui.container.TabGroup
        RTab                   matlab.ui.container.Tab
        Label_2                matlab.ui.control.Label
        EditField_2            matlab.ui.control.NumericEditField
        Label                  matlab.ui.control.Label
        EditField              matlab.ui.control.NumericEditField
        RLabel                 matlab.ui.control.Label
        REditField             matlab.ui.control.NumericEditField
        Label_3                matlab.ui.control.Label
        GR1RLabel              matlab.ui.control.Label
        CTab                   matlab.ui.container.Tab
        EditField_3Label       matlab.ui.control.Label
        EditField_3            matlab.ui.control.NumericEditField
        EditField_4Label       matlab.ui.control.Label
        EditField_4            matlab.ui.control.NumericEditField
        Label_4                matlab.ui.control.Label
        CEditFieldLabel        matlab.ui.control.Label
        CEditField             matlab.ui.control.NumericEditField
        GCjCLabel              matlab.ui.control.Label
        LTab                   matlab.ui.container.Tab
        EditField_5Label       matlab.ui.control.Label
        EditField_5            matlab.ui.control.NumericEditField
        EditField_6Label       matlab.ui.control.Label
        EditField_6            matlab.ui.control.NumericEditField
        Label_5                matlab.ui.control.Label
        LEditFieldLabel        matlab.ui.control.Label
        LEditField             matlab.ui.control.NumericEditField
        GLjLLabel              matlab.ui.control.Label
        VTab                   matlab.ui.container.Tab
        EditField_7Label       matlab.ui.control.Label
        EditField_7            matlab.ui.control.NumericEditField
        EditField_8Label       matlab.ui.control.Label
        EditField_8            matlab.ui.control.NumericEditField
        Label_6                matlab.ui.control.Label
        USEditFieldLabel       matlab.ui.control.Label
        USEditField            matlab.ui.control.NumericEditField
        Label_7                matlab.ui.control.Label
        Label_8                matlab.ui.control.Label
        EditField_9            matlab.ui.control.NumericEditField
        USUScosjUSsinLabel     matlab.ui.control.Label
        GTab                   matlab.ui.container.Tab
        EditField_10Label      matlab.ui.control.Label
        EditField_10           matlab.ui.control.NumericEditField
        Button_5               matlab.ui.control.Button
        radsLabel              matlab.ui.control.Label
        Label_9                matlab.ui.control.Label
        EditField_11           matlab.ui.control.NumericEditField
        UITable                matlab.ui.control.Table
        Panel_2                matlab.ui.container.Panel
        GridLayout             matlab.ui.container.GridLayout
        Button_7               matlab.ui.control.Button
        TextArea2              matlab.ui.control.TextArea
        Button_8               matlab.ui.control.Button
        EditField_12           matlab.ui.control.NumericEditField
        EditField_13           matlab.ui.control.NumericEditField
        Label_10               matlab.ui.control.Label
        TabGroup2              matlab.ui.container.TabGroup
        Tab                    matlab.ui.container.Tab
        GridLayout2            matlab.ui.container.GridLayout
        UIAxes                 matlab.ui.control.UIAxes
        Tab_2                  matlab.ui.container.Tab
        UIAxes_2               matlab.ui.control.UIAxes
        Tab_3                  matlab.ui.container.Tab
        UIAxes_3               matlab.ui.control.UIAxes
        Tab_4                  matlab.ui.container.Tab
        UIAxes_4               matlab.ui.control.UIAxes
    end

    
    methods (Access = public)
        function results = getData(app,text)
            switch text
                case "ÿÿ"
                    name="ÿÿ";
                    node1=app.EditField.Value;
                    node2=app.EditField_2.Value;
                    value1=app.REditField.Value;
                    value2=-1;
                        
                case "ÿÿ"
                    name="ÿÿ";
                    node1=app.EditField_4.Value;
                    node2=app.EditField_3.Value;
                    value1=app.CEditField.Value;
                    value2=-1;
                    
                case "ÿÿ"
                    name="ÿÿ";
                    node1=app.EditField_6.Value;
                    node2=app.EditField_5.Value;
                    value1=app.LEditField.Value;
                    value2=-1;
                    
                case "ÿÿÿ"
                    name="ÿÿÿ";
                    node1=app.EditField_8.Value;
                    node2=app.EditField_7.Value;
                    value1=app.USEditField.Value;
                    value2=app.EditField_9.Value;
                    
                otherwise
                    name="ÿÿ";
                    node1=app.EditField_10.Value;
                    node2=-1;
                    value1=-1;
                    value2=-1;
                    
            end
            
            results=[name,node1,node2,value1,value2];
        end
        
        
        function results = nodeVoltage(app,data,omega)
            global nodeNum;
            AA = zeros(nodeNum+1);
            bb = zeros(nodeNum+1,1);      
            %ÿÿÿÿÿÿ1
            VSNum=1; 
            %nodeNum ÿÿÿÿÿÿ
            nodeNums = nodeNum + 1;
            % ÿÿ
            jiedi=0;
            jiedistr=strfind(data,"ÿÿ");
            for j=1:size(jiedistr,1)
                a=isempty(jiedistr{j,1});
                if a==0
                    jiedi=jiedi+1;
                end
            end
            cpNum=size(data,1)-jiedi; 
            % omega
            
            for i=1:cpNum
                cpName=string(data(i,1));
                cpNo1=int8(str2double(data(i,2))+1);
                cpNo2=int8(str2double(data(i,3))+1);    
                cpValue1=str2double(data(i,4));
                cpValue2=str2double(data(i,5));              

                switch char(cpName)           
                    case 'ÿÿÿ'
                        %cpValue = 
                        cpValue=complex(cpValue1.*cosd(cpValue2),cpValue1.*sind(cpValue2));
                        %ÿÿÿÿ
                        AA(nodeNums+VSNum,nodeNums+VSNum)= 0;
                        bb(nodeNums+VSNum)=0;
                        
                        AA(cpNo1,nodeNums+VSNum)= AA(cpNo1,nodeNums+VSNum) + 1;
                        AA(cpNo2,nodeNums+VSNum)= AA(cpNo2,nodeNums+VSNum) - 1;
                        AA(nodeNums+VSNum,cpNo1)= AA(nodeNums+VSNum,cpNo1) + 1;
                        AA(nodeNums+VSNum,cpNo2)= AA(nodeNums+VSNum,cpNo2) - 1;
                        bb(nodeNums+VSNum)=bb(nodeNums+VSNum)+cpValue;
                        VSNum=VSNum+1;
                    case 'ÿÿ'
                        cpValue=complex(1/cpValue1,0);
                        AA(cpNo1,cpNo1)= AA(cpNo1,cpNo1)+cpValue;
                        AA(cpNo1,cpNo2)= AA(cpNo1,cpNo2)-cpValue;
                        AA(cpNo2,cpNo1)= AA(cpNo2,cpNo1)-cpValue;
                        AA(cpNo2,cpNo2)= AA(cpNo2,cpNo2)+cpValue;
                    case 'ÿÿ'
                        cpValue=complex(0,omega.*cpValue1);
                        AA(cpNo1,cpNo1)= AA(cpNo1,cpNo1)+cpValue;
                        AA(cpNo1,cpNo2)= AA(cpNo1,cpNo2)-cpValue;
                        AA(cpNo2,cpNo1)= AA(cpNo2,cpNo1)-cpValue;
                        AA(cpNo2,cpNo2)= AA(cpNo2,cpNo2)+cpValue;
                    case 'ÿÿ'
                        cpValue=complex(0,-1/(omega.*cpValue1));
                        AA(cpNo1,cpNo1)= AA(cpNo1,cpNo1)+cpValue;
                        AA(cpNo1,cpNo2)= AA(cpNo1,cpNo2)-cpValue;
                        AA(cpNo2,cpNo1)= AA(cpNo2,cpNo1)-cpValue;
                        AA(cpNo2,cpNo2)= AA(cpNo2,cpNo2)+cpValue;
                    case 'ÿÿ'
                        
                    otherwise
                        msgbox("error")
                end
                
            end
            AA(1,:)=[];
            AA(:,1)=[];
            bb(1)=[];
            answer=AA\bb;
            for i=1:(VSNum-1)
                answer(end,:)=[];
            end
            results=answer;
        end
        
        function setNodeNum(app,data)
            global nodeNum;
            r=str2double(data(:,2:3));
            nodeNum=int8(max(max(r)));
        end
        
        function results = getCol(app,collection)
            s=size(collection,1);
            for i=1:s
                if collection(i,1)=="ÿÿÿ"
                    results=i;
                end
            end
        end
        
        function results = getRes(app,collection)
            s=size(collection,1);
            for i=1:s
                if  or(and(collection(i,2)=="1",collection(i,3)=="2"),and(collection(i,2)=="2",collection(i,3)=="1"))
                    results=i;
                    break;
                end  
            end
            
        end
        function results = getPo(app,collection,name)
            s=size(collection,1);
            for i=1:s
                if collection(i,1)==name
                    results=i;
                    break;
                end
            end
        end
    end
    

    % Callbacks that handle component events
    methods (Access = private)

        % Code that executes after component creation
        function startupFcn(app)
            clear;
            app.UITable.ColumnName = ["ÿÿ","ÿÿ1","ÿÿ2","ÿ1","ÿ2"];
        end

        % Selection changed function: ButtonGroup
        function ButtonGroupSelectionChanged(app, event)
            selectedButton = app.ButtonGroup.SelectedObject;
            switch selectedButton.Text
                case "ÿÿ"
                    app.TabGroup.SelectedTab=app.RTab;
                case "ÿÿ"
                    app.TabGroup.SelectedTab=app.CTab;
                case "ÿÿ"
                    app.TabGroup.SelectedTab=app.LTab;
                case "ÿÿÿ"
                    app.TabGroup.SelectedTab=app.VTab;
                otherwise
                    app.TabGroup.SelectedTab=app.GTab;
            end
        end

        % Button pushed function: Button_5
        function Button_5Pushed(app, event)
            selectedButton = app.ButtonGroup.SelectedObject;
            d1 = getData(app,selectedButton.Text);
            app.UITable.Data=[app.UITable.Data;d1];
        end

        % Menu selected function: Menu_3
        function Menu_3Selected(app, event)
            data=app.UITable.Data;
            filepath = uigetdir('*.*','ÿÿÿÿÿÿ');
            today=datetime("today","Format","uuuu_MM_dd");
            str=[filepath,"/Circuit_Data_",string(today),".mat"];
            filename=join(str,'');
            save(filename,'data');
        end

        % Menu selected function: Menu_2
        function Menu_2Selected(app, event)
            [filename,filepath]=uigetfile('*.mat','ÿÿÿÿÿ');
            str=[filepath,filename];
            name=join(str);
            D=load(name,'data');
            da=D.data;
            app.UITable.Data=da;
        end

        % Button pushed function: Button_7
        function Button_7Pushed(app, event)
            data=app.UITable.Data;
            omega=app.EditField_11.Value;
            setNodeNum(app,data);
            answer=nodeVoltage(app,data,omega);
            tmp=[];
            for i=1:size(answer,1)
                tmp=[tmp;"ÿÿ "+string(i)+" = "+answer(i)+" V"];
            end
            n1=app.EditField_12.Value;
            n2=app.EditField_13.Value;
            try
                diff=answer(n1)-answer(n2);
                tmp=[tmp;"ÿÿ "+string(n2)+" ÿÿÿ "+string(n1)+" ÿÿÿÿÿ "+string(diff)+" V"];
            catch
                
            end
            app.TextArea2.Value=tmp;
        end

        % Callback function
        function radsKnobValueChanged(app, event)
            value = app.radsKnob.Value;
            app.EditField_11.Value=floor(value);
        end

        % Callback function
        function EditField_11ValueChanged(app, event)
            value = app.EditField_11.Value;
            app.radsKnob.Value=value;
        end

        % Callback function
        function radsKnobValueChanging(app, event)
            changingValue = event.Value;
            app.EditField_11.Value=floor(changingValue);
        end

        % Button pushed function: Button_8
        function Button_8Pushed(app, event)
            data=app.UITable.Data;
            posi=getCol(app,data);
            resP=getRes(app,data);
            setNodeNum(app,data);
            i=1;
            for omega=0:2:2000
                tmp=data;
                voltage=nodeVoltage(app,tmp,omega);           
                resV=str2double(tmp(resP,4));
                value(i)=voltage(1)/((voltage(1)-voltage(2))/resV);
                absZ(i)=abs(value(i));
                theata(i)=angle(value(i))/(2.*pi)*360;
                value2(i)=voltage(1)/voltage(3);
                absH(i)=20.*log10(abs(value2(i)));
                theata2(i)=angle(value2(i))/(2.*pi)*360;
                i=i+1;
            end
            x=0:2:2000;
            plot(app.UIAxes,x,absZ);
            app.UIAxes.Title.String = 'ÿÿÿÿ';
            app.UIAxes.XLabel.String = 'omega';
            app.UIAxes.XLabel.String = 'absZ';
            plot(app.UIAxes_2,x,theata)
            app.UIAxes_2.Title.String = 'ÿÿÿÿ';
            app.UIAxes_2.XLabel.String = 'omega';
            app.UIAxes_2.XLabel.String = 'theata';
            plot(app.UIAxes_3,x,absH)
            app.UIAxes_3.Title.String = 'ÿÿÿÿÿ';
            app.UIAxes_3.XLabel.String = 'omega';
            app.UIAxes_3.XLabel.String = 'absH';
            plot(app.UIAxes_4,x,theata2)
            app.UIAxes_4.Title.String = 'ÿÿÿÿÿ';
            app.UIAxes_4.XLabel.String = 'omega';
            app.UIAxes_4.XLabel.String = 'theata2';
            
            tmp2=app.TextArea2.Value;
            tmp2=[];
            tmp2=[tmp2;"ÿÿÿÿRLCÿÿÿÿÿÿÿÿÿ"];
            l=str2double(data(getPo(app,data,"ÿÿ"),4));
            c=str2double(data(getPo(app,data,"ÿÿ"),4));
            r=str2double(data(getPo(app,data,"ÿÿ"),4));
            o0=1/sqrt(l.*c);
            q=l.*o0/r;
            tmp2=[tmp2;"1ÿomega_0 = "+string(o0)+" rad/s"];
            tmp2=[tmp2;"2ÿQ = "+string(q)+" "];
            tmp2=[tmp2;"3ÿBW = "+string(o0/q)+" "];
            app.TextArea2.Value=tmp2;
            
        end
    end

    % Component initialization
    methods (Access = private)

        % Create UIFigure and components
        function createComponents(app)

            % Create UIFigure and hide until all components are created
            app.UIFigure = uifigure('Visible', 'off');
            app.UIFigure.Color = [0.9412 0.9412 0.9412];
            app.UIFigure.Colormap = [0.2431 0.149 0.6588;0.2431 0.1529 0.6745;0.2471 0.1569 0.6863;0.2471 0.1608 0.698;0.251 0.1647 0.7059;0.251 0.1686 0.7176;0.2549 0.1725 0.7294;0.2549 0.1765 0.7412;0.2588 0.1804 0.749;0.2588 0.1843 0.7608;0.2627 0.1882 0.7725;0.2627 0.1922 0.7843;0.2627 0.1961 0.7922;0.2667 0.2 0.8039;0.2667 0.2039 0.8157;0.2706 0.2078 0.8235;0.2706 0.2157 0.8353;0.2706 0.2196 0.8431;0.2745 0.2235 0.851;0.2745 0.2275 0.8627;0.2745 0.2314 0.8706;0.2745 0.2392 0.8784;0.2784 0.2431 0.8824;0.2784 0.2471 0.8902;0.2784 0.2549 0.898;0.2784 0.2588 0.902;0.2784 0.2667 0.9098;0.2784 0.2706 0.9137;0.2784 0.2745 0.9216;0.2824 0.2824 0.9255;0.2824 0.2863 0.9294;0.2824 0.2941 0.9333;0.2824 0.298 0.9412;0.2824 0.3059 0.9451;0.2824 0.3098 0.949;0.2824 0.3137 0.9529;0.2824 0.3216 0.9569;0.2824 0.3255 0.9608;0.2824 0.3294 0.9647;0.2784 0.3373 0.9686;0.2784 0.3412 0.9686;0.2784 0.349 0.9725;0.2784 0.3529 0.9765;0.2784 0.3569 0.9804;0.2784 0.3647 0.9804;0.2745 0.3686 0.9843;0.2745 0.3765 0.9843;0.2745 0.3804 0.9882;0.2706 0.3843 0.9882;0.2706 0.3922 0.9922;0.2667 0.3961 0.9922;0.2627 0.4039 0.9922;0.2627 0.4078 0.9961;0.2588 0.4157 0.9961;0.2549 0.4196 0.9961;0.251 0.4275 0.9961;0.2471 0.4314 1;0.2431 0.4392 1;0.2353 0.4431 1;0.2314 0.451 1;0.2235 0.4549 1;0.2196 0.4627 0.9961;0.2118 0.4667 0.9961;0.2078 0.4745 0.9922;0.2 0.4784 0.9922;0.1961 0.4863 0.9882;0.1922 0.4902 0.9882;0.1882 0.498 0.9843;0.1843 0.502 0.9804;0.1843 0.5098 0.9804;0.1804 0.5137 0.9765;0.1804 0.5176 0.9725;0.1804 0.5255 0.9725;0.1804 0.5294 0.9686;0.1765 0.5333 0.9647;0.1765 0.5412 0.9608;0.1765 0.5451 0.9569;0.1765 0.549 0.9529;0.1765 0.5569 0.949;0.1725 0.5608 0.9451;0.1725 0.5647 0.9412;0.1686 0.5686 0.9373;0.1647 0.5765 0.9333;0.1608 0.5804 0.9294;0.1569 0.5843 0.9255;0.1529 0.5922 0.9216;0.1529 0.5961 0.9176;0.149 0.6 0.9137;0.149 0.6039 0.9098;0.1451 0.6078 0.9098;0.1451 0.6118 0.9059;0.1412 0.6196 0.902;0.1412 0.6235 0.898;0.1373 0.6275 0.898;0.1373 0.6314 0.8941;0.1333 0.6353 0.8941;0.1294 0.6392 0.8902;0.1255 0.6471 0.8902;0.1216 0.651 0.8863;0.1176 0.6549 0.8824;0.1137 0.6588 0.8824;0.1137 0.6627 0.8784;0.1098 0.6667 0.8745;0.1059 0.6706 0.8706;0.102 0.6745 0.8667;0.098 0.6784 0.8627;0.0902 0.6824 0.8549;0.0863 0.6863 0.851;0.0784 0.6902 0.8471;0.0706 0.6941 0.8392;0.0627 0.698 0.8353;0.0549 0.702 0.8314;0.0431 0.702 0.8235;0.0314 0.7059 0.8196;0.0235 0.7098 0.8118;0.0157 0.7137 0.8078;0.0078 0.7176 0.8;0.0039 0.7176 0.7922;0 0.7216 0.7882;0 0.7255 0.7804;0 0.7294 0.7765;0.0039 0.7294 0.7686;0.0078 0.7333 0.7608;0.0157 0.7333 0.7569;0.0235 0.7373 0.749;0.0353 0.7412 0.7412;0.051 0.7412 0.7373;0.0627 0.7451 0.7294;0.0784 0.7451 0.7216;0.0902 0.749 0.7137;0.102 0.7529 0.7098;0.1137 0.7529 0.702;0.1255 0.7569 0.6941;0.1373 0.7569 0.6863;0.1451 0.7608 0.6824;0.1529 0.7608 0.6745;0.1608 0.7647 0.6667;0.1686 0.7647 0.6588;0.1725 0.7686 0.651;0.1804 0.7686 0.6471;0.1843 0.7725 0.6392;0.1922 0.7725 0.6314;0.1961 0.7765 0.6235;0.2 0.7804 0.6157;0.2078 0.7804 0.6078;0.2118 0.7843 0.6;0.2196 0.7843 0.5882;0.2235 0.7882 0.5804;0.2314 0.7882 0.5725;0.2392 0.7922 0.5647;0.251 0.7922 0.5529;0.2588 0.7922 0.5451;0.2706 0.7961 0.5373;0.2824 0.7961 0.5255;0.2941 0.7961 0.5176;0.3059 0.8 0.5059;0.3176 0.8 0.498;0.3294 0.8 0.4863;0.3412 0.8 0.4784;0.3529 0.8 0.4667;0.3686 0.8039 0.4549;0.3804 0.8039 0.4471;0.3922 0.8039 0.4353;0.4039 0.8039 0.4235;0.4196 0.8039 0.4118;0.4314 0.8039 0.4;0.4471 0.8039 0.3922;0.4627 0.8 0.3804;0.4745 0.8 0.3686;0.4902 0.8 0.3569;0.5059 0.8 0.349;0.5176 0.8 0.3373;0.5333 0.7961 0.3255;0.5451 0.7961 0.3176;0.5608 0.7961 0.3059;0.5765 0.7922 0.2941;0.5882 0.7922 0.2824;0.6039 0.7882 0.2745;0.6157 0.7882 0.2627;0.6314 0.7843 0.251;0.6431 0.7843 0.2431;0.6549 0.7804 0.2314;0.6706 0.7804 0.2235;0.6824 0.7765 0.2157;0.698 0.7765 0.2078;0.7098 0.7725 0.2;0.7216 0.7686 0.1922;0.7333 0.7686 0.1843;0.7451 0.7647 0.1765;0.7608 0.7647 0.1725;0.7725 0.7608 0.1647;0.7843 0.7569 0.1608;0.7961 0.7569 0.1569;0.8078 0.7529 0.1529;0.8157 0.749 0.1529;0.8275 0.749 0.1529;0.8392 0.7451 0.1529;0.851 0.7451 0.1569;0.8588 0.7412 0.1569;0.8706 0.7373 0.1608;0.8824 0.7373 0.1647;0.8902 0.7373 0.1686;0.902 0.7333 0.1765;0.9098 0.7333 0.1804;0.9176 0.7294 0.1882;0.9255 0.7294 0.1961;0.9373 0.7294 0.2078;0.9451 0.7294 0.2157;0.9529 0.7294 0.2235;0.9608 0.7294 0.2314;0.9686 0.7294 0.2392;0.9765 0.7294 0.2431;0.9843 0.7333 0.2431;0.9882 0.7373 0.2431;0.9961 0.7412 0.2392;0.9961 0.7451 0.2353;0.9961 0.7529 0.2314;0.9961 0.7569 0.2275;0.9961 0.7608 0.2235;0.9961 0.7686 0.2196;0.9961 0.7725 0.2157;0.9961 0.7804 0.2078;0.9961 0.7843 0.2039;0.9961 0.7922 0.2;0.9922 0.7961 0.1961;0.9922 0.8039 0.1922;0.9922 0.8078 0.1922;0.9882 0.8157 0.1882;0.9843 0.8235 0.1843;0.9843 0.8275 0.1804;0.9804 0.8353 0.1804;0.9765 0.8392 0.1765;0.9765 0.8471 0.1725;0.9725 0.851 0.1686;0.9686 0.8588 0.1647;0.9686 0.8667 0.1647;0.9647 0.8706 0.1608;0.9647 0.8784 0.1569;0.9608 0.8824 0.1569;0.9608 0.8902 0.1529;0.9608 0.898 0.149;0.9608 0.902 0.149;0.9608 0.9098 0.1451;0.9608 0.9137 0.1412;0.9608 0.9216 0.1373;0.9608 0.9255 0.1333;0.9608 0.9333 0.1294;0.9647 0.9373 0.1255;0.9647 0.9451 0.1216;0.9647 0.949 0.1176;0.9686 0.9569 0.1098;0.9686 0.9608 0.1059;0.9725 0.9686 0.102;0.9725 0.9725 0.0941;0.9765 0.9765 0.0863;0.9765 0.9843 0.0824];
            app.UIFigure.Position = [100 100 755 462];
            app.UIFigure.Name = 'ÿÿÿÿ';

            % Create Menu
            app.Menu = uimenu(app.UIFigure);
            app.Menu.Text = 'ÿÿ';

            % Create Menu_2
            app.Menu_2 = uimenu(app.Menu);
            app.Menu_2.MenuSelectedFcn = createCallbackFcn(app, @Menu_2Selected, true);
            app.Menu_2.Text = 'ÿÿ...';

            % Create Menu_3
            app.Menu_3 = uimenu(app.Menu);
            app.Menu_3.MenuSelectedFcn = createCallbackFcn(app, @Menu_3Selected, true);
            app.Menu_3.Text = 'ÿÿÿ...';

            % Create Menu_4
            app.Menu_4 = uimenu(app.UIFigure);
            app.Menu_4.Text = 'ÿÿ';

            % Create poweredat20191219Menu
            app.poweredat20191219Menu = uimenu(app.Menu_4);
            app.poweredat20191219Menu.Text = 'powered at 2019.12.19';

            % Create LazeVitaMenu
            app.LazeVitaMenu = uimenu(app.poweredat20191219Menu);
            app.LazeVitaMenu.Text = 'LazeVita';

            % Create GalileoGalileocnMenu
            app.GalileoGalileocnMenu = uimenu(app.LazeVitaMenu);
            app.GalileoGalileocnMenu.Text = 'Galileo-Galileo.cn';

            % Create Panel
            app.Panel = uipanel(app.UIFigure);
            app.Panel.TitlePosition = 'centertop';
            app.Panel.Title = 'ÿÿÿÿ';
            app.Panel.Position = [448 205 303 252];

            % Create ButtonGroup
            app.ButtonGroup = uibuttongroup(app.Panel);
            app.ButtonGroup.SelectionChangedFcn = createCallbackFcn(app, @ButtonGroupSelectionChanged, true);
            app.ButtonGroup.TitlePosition = 'centertop';
            app.ButtonGroup.Title = 'ÿÿÿÿ';
            app.ButtonGroup.Position = [7 46 122 178];

            % Create Button
            app.Button = uitogglebutton(app.ButtonGroup);
            app.Button.Text = 'ÿÿ';
            app.Button.Position = [11 125 100 25];
            app.Button.Value = true;

            % Create Button_2
            app.Button_2 = uitogglebutton(app.ButtonGroup);
            app.Button_2.Text = 'ÿÿ';
            app.Button_2.Position = [11 97 100 25];

            % Create Button_3
            app.Button_3 = uitogglebutton(app.ButtonGroup);
            app.Button_3.Text = 'ÿÿ';
            app.Button_3.Position = [11 69 100 25];

            % Create Button_4
            app.Button_4 = uitogglebutton(app.ButtonGroup);
            app.Button_4.Text = 'ÿÿÿ';
            app.Button_4.Position = [11 41 100 25];

            % Create Button_6
            app.Button_6 = uitogglebutton(app.ButtonGroup);
            app.Button_6.Text = 'ÿÿ';
            app.Button_6.Position = [11 13 100 25];

            % Create TabGroup
            app.TabGroup = uitabgroup(app.Panel);
            app.TabGroup.Position = [128 46 168 178];

            % Create RTab
            app.RTab = uitab(app.TabGroup);
            app.RTab.Title = 'R';

            % Create Label_2
            app.Label_2 = uilabel(app.RTab);
            app.Label_2.HorizontalAlignment = 'right';
            app.Label_2.Position = [86 117 25 22];
            app.Label_2.Text = 'ÿ';

            % Create EditField_2
            app.EditField_2 = uieditfield(app.RTab, 'numeric');
            app.EditField_2.Position = [110 117 38 22];

            % Create Label
            app.Label = uilabel(app.RTab);
            app.Label.HorizontalAlignment = 'right';
            app.Label.Position = [13 117 29 22];
            app.Label.Text = 'ÿÿ';

            % Create EditField
            app.EditField = uieditfield(app.RTab, 'numeric');
            app.EditField.Position = [49 117 38 22];

            % Create RLabel
            app.RLabel = uilabel(app.RTab);
            app.RLabel.HorizontalAlignment = 'right';
            app.RLabel.Position = [13 82 25 22];
            app.RLabel.Text = 'R =';

            % Create REditField
            app.REditField = uieditfield(app.RTab, 'numeric');
            app.REditField.Position = [49 82 62 22];

            % Create Label_3
            app.Label_3 = uilabel(app.RTab);
            app.Label_3.Position = [127 82 25 22];
            app.Label_3.Text = 'ÿ';

            % Create GR1RLabel
            app.GR1RLabel = uilabel(app.RTab);
            app.GR1RLabel.Position = [19 48 56 22];
            app.GR1RLabel.Text = 'GR = 1/R';

            % Create CTab
            app.CTab = uitab(app.TabGroup);
            app.CTab.Title = 'C';

            % Create EditField_3Label
            app.EditField_3Label = uilabel(app.CTab);
            app.EditField_3Label.HorizontalAlignment = 'right';
            app.EditField_3Label.Position = [86 117 25 22];
            app.EditField_3Label.Text = 'ÿ';

            % Create EditField_3
            app.EditField_3 = uieditfield(app.CTab, 'numeric');
            app.EditField_3.Position = [110 117 38 22];

            % Create EditField_4Label
            app.EditField_4Label = uilabel(app.CTab);
            app.EditField_4Label.HorizontalAlignment = 'right';
            app.EditField_4Label.Position = [13 117 29 22];
            app.EditField_4Label.Text = 'ÿÿ';

            % Create EditField_4
            app.EditField_4 = uieditfield(app.CTab, 'numeric');
            app.EditField_4.Position = [49 117 38 22];

            % Create Label_4
            app.Label_4 = uilabel(app.CTab);
            app.Label_4.Position = [127 82 25 22];
            app.Label_4.Text = 'ÿ';

            % Create CEditFieldLabel
            app.CEditFieldLabel = uilabel(app.CTab);
            app.CEditFieldLabel.HorizontalAlignment = 'right';
            app.CEditFieldLabel.Position = [13 82 25 22];
            app.CEditFieldLabel.Text = 'C =';

            % Create CEditField
            app.CEditField = uieditfield(app.CTab, 'numeric');
            app.CEditField.Position = [49 82 62 22];

            % Create GCjCLabel
            app.GCjCLabel = uilabel(app.CTab);
            app.GCjCLabel.Position = [19 48 62 22];
            app.GCjCLabel.Text = 'GC = -jÿC';

            % Create LTab
            app.LTab = uitab(app.TabGroup);
            app.LTab.Title = 'L';

            % Create EditField_5Label
            app.EditField_5Label = uilabel(app.LTab);
            app.EditField_5Label.HorizontalAlignment = 'right';
            app.EditField_5Label.Position = [86 117 25 22];
            app.EditField_5Label.Text = 'ÿ';

            % Create EditField_5
            app.EditField_5 = uieditfield(app.LTab, 'numeric');
            app.EditField_5.Position = [110 117 38 22];

            % Create EditField_6Label
            app.EditField_6Label = uilabel(app.LTab);
            app.EditField_6Label.HorizontalAlignment = 'right';
            app.EditField_6Label.Position = [13 117 29 22];
            app.EditField_6Label.Text = 'ÿÿ';

            % Create EditField_6
            app.EditField_6 = uieditfield(app.LTab, 'numeric');
            app.EditField_6.Position = [49 117 38 22];

            % Create Label_5
            app.Label_5 = uilabel(app.LTab);
            app.Label_5.Position = [127 82 25 22];
            app.Label_5.Text = 'ÿ';

            % Create LEditFieldLabel
            app.LEditFieldLabel = uilabel(app.LTab);
            app.LEditFieldLabel.HorizontalAlignment = 'right';
            app.LEditFieldLabel.Position = [13 82 25 22];
            app.LEditFieldLabel.Text = 'L =';

            % Create LEditField
            app.LEditField = uieditfield(app.LTab, 'numeric');
            app.LEditField.Position = [49 82 62 22];

            % Create GLjLLabel
            app.GLjLLabel = uilabel(app.LTab);
            app.GLjLLabel.Position = [20 48 75 22];
            app.GLjLLabel.Text = 'GL = -j / (ÿL)';

            % Create VTab
            app.VTab = uitab(app.TabGroup);
            app.VTab.Title = 'V';

            % Create EditField_7Label
            app.EditField_7Label = uilabel(app.VTab);
            app.EditField_7Label.HorizontalAlignment = 'right';
            app.EditField_7Label.Position = [86 117 25 22];
            app.EditField_7Label.Text = 'ÿ';

            % Create EditField_7
            app.EditField_7 = uieditfield(app.VTab, 'numeric');
            app.EditField_7.Position = [110 117 38 22];

            % Create EditField_8Label
            app.EditField_8Label = uilabel(app.VTab);
            app.EditField_8Label.HorizontalAlignment = 'right';
            app.EditField_8Label.Position = [13 117 29 22];
            app.EditField_8Label.Text = 'ÿÿ';

            % Create EditField_8
            app.EditField_8 = uieditfield(app.VTab, 'numeric');
            app.EditField_8.Position = [49 117 38 22];

            % Create Label_6
            app.Label_6 = uilabel(app.VTab);
            app.Label_6.Position = [127 82 25 22];
            app.Label_6.Text = 'ÿ';

            % Create USEditFieldLabel
            app.USEditFieldLabel = uilabel(app.VTab);
            app.USEditFieldLabel.HorizontalAlignment = 'right';
            app.USEditFieldLabel.Position = [6 82 32 22];
            app.USEditFieldLabel.Text = 'US =';

            % Create USEditField
            app.USEditField = uieditfield(app.VTab, 'numeric');
            app.USEditField.Position = [49 82 62 22];

            % Create Label_7
            app.Label_7 = uilabel(app.VTab);
            app.Label_7.Position = [127 44 25 22];
            app.Label_7.Text = 'ÿ';

            % Create Label_8
            app.Label_8 = uilabel(app.VTab);
            app.Label_8.HorizontalAlignment = 'right';
            app.Label_8.Position = [13 44 25 22];
            app.Label_8.Text = 'ÿ =';

            % Create EditField_9
            app.EditField_9 = uieditfield(app.VTab, 'numeric');
            app.EditField_9.Position = [49 44 62 22];

            % Create USUScosjUSsinLabel
            app.USUScosjUSsinLabel = uilabel(app.VTab);
            app.USUScosjUSsinLabel.Position = [5 9 153 22];
            app.USUScosjUSsinLabel.Text = 'US =US cos(ÿ) + jUS sin(ÿ)';

            % Create GTab
            app.GTab = uitab(app.TabGroup);
            app.GTab.Title = 'G';

            % Create EditField_10Label
            app.EditField_10Label = uilabel(app.GTab);
            app.EditField_10Label.HorizontalAlignment = 'right';
            app.EditField_10Label.Position = [13 117 29 22];
            app.EditField_10Label.Text = 'ÿÿ';

            % Create EditField_10
            app.EditField_10 = uieditfield(app.GTab, 'numeric');
            app.EditField_10.Position = [49 117 38 22];

            % Create Button_5
            app.Button_5 = uibutton(app.Panel, 'push');
            app.Button_5.ButtonPushedFcn = createCallbackFcn(app, @Button_5Pushed, true);
            app.Button_5.Position = [133 13 162 25];
            app.Button_5.Text = 'ÿÿÿÿ';

            % Create radsLabel
            app.radsLabel = uilabel(app.Panel);
            app.radsLabel.Position = [93 14 33 22];
            app.radsLabel.Text = 'rad/s';

            % Create Label_9
            app.Label_9 = uilabel(app.Panel);
            app.Label_9.HorizontalAlignment = 'right';
            app.Label_9.Position = [18 14 25 22];
            app.Label_9.Text = 'ÿ =';

            % Create EditField_11
            app.EditField_11 = uieditfield(app.Panel, 'numeric');
            app.EditField_11.Position = [54 14 29 22];
            app.EditField_11.Value = 50;

            % Create UITable
            app.UITable = uitable(app.UIFigure);
            app.UITable.ColumnName = {'ÿÿ'; 'ÿÿ1'; 'ÿÿ2'; 'ÿ1'; 'ÿ2'};
            app.UITable.RowName = {};
            app.UITable.ColumnEditable = true;
            app.UITable.Position = [361 7 390 193];

            % Create Panel_2
            app.Panel_2 = uipanel(app.UIFigure);
            app.Panel_2.Title = 'ÿÿÿÿ';
            app.Panel_2.Position = [9 7 347 193];

            % Create GridLayout
            app.GridLayout = uigridlayout(app.Panel_2);
            app.GridLayout.ColumnWidth = {'1x', '1x', '2x', '2x'};
            app.GridLayout.RowHeight = {'1x', '1x', '1x'};

            % Create Button_7
            app.Button_7 = uibutton(app.GridLayout, 'push');
            app.Button_7.ButtonPushedFcn = createCallbackFcn(app, @Button_7Pushed, true);
            app.Button_7.Layout.Row = 1;
            app.Button_7.Layout.Column = [1 2];
            app.Button_7.Text = 'ÿÿÿÿÿÿ';

            % Create TextArea2
            app.TextArea2 = uitextarea(app.GridLayout);
            app.TextArea2.Layout.Row = [1 2];
            app.TextArea2.Layout.Column = [3 4];

            % Create Button_8
            app.Button_8 = uibutton(app.GridLayout, 'push');
            app.Button_8.ButtonPushedFcn = createCallbackFcn(app, @Button_8Pushed, true);
            app.Button_8.Layout.Row = 2;
            app.Button_8.Layout.Column = [1 2];
            app.Button_8.Text = 'ÿÿÿÿ';

            % Create EditField_12
            app.EditField_12 = uieditfield(app.GridLayout, 'numeric');
            app.EditField_12.HorizontalAlignment = 'center';
            app.EditField_12.Layout.Row = 3;
            app.EditField_12.Layout.Column = 3;

            % Create EditField_13
            app.EditField_13 = uieditfield(app.GridLayout, 'numeric');
            app.EditField_13.HorizontalAlignment = 'center';
            app.EditField_13.Layout.Row = 3;
            app.EditField_13.Layout.Column = 4;
            app.EditField_13.Value = 3;

            % Create Label_10
            app.Label_10 = uilabel(app.GridLayout);
            app.Label_10.HorizontalAlignment = 'center';
            app.Label_10.Layout.Row = 3;
            app.Label_10.Layout.Column = [1 2];
            app.Label_10.Text = 'ÿÿÿÿÿÿ';

            % Create TabGroup2
            app.TabGroup2 = uitabgroup(app.UIFigure);
            app.TabGroup2.Position = [9 205 434 252];

            % Create Tab
            app.Tab = uitab(app.TabGroup2);
            app.Tab.Title = 'ÿÿ';

            % Create GridLayout2
            app.GridLayout2 = uigridlayout(app.Tab);
            app.GridLayout2.ColumnWidth = {'3.57x'};
            app.GridLayout2.RowHeight = {'6.96x'};

            % Create UIAxes
            app.UIAxes = uiaxes(app.GridLayout2);
            title(app.UIAxes, 'Title')
            xlabel(app.UIAxes, 'X')
            ylabel(app.UIAxes, 'Y')
            app.UIAxes.TitleFontWeight = 'bold';
            app.UIAxes.Layout.Row = 1;
            app.UIAxes.Layout.Column = 1;

            % Create Tab_2
            app.Tab_2 = uitab(app.TabGroup2);
            app.Tab_2.Title = 'ÿÿ';

            % Create UIAxes_2
            app.UIAxes_2 = uiaxes(app.Tab_2);
            title(app.UIAxes_2, 'Title')
            xlabel(app.UIAxes_2, 'X')
            ylabel(app.UIAxes_2, 'Y')
            app.UIAxes_2.TitleFontWeight = 'bold';
            app.UIAxes_2.Position = [8 12 412 206];

            % Create Tab_3
            app.Tab_3 = uitab(app.TabGroup2);
            app.Tab_3.Title = 'ÿÿÿÿÿ';

            % Create UIAxes_3
            app.UIAxes_3 = uiaxes(app.Tab_3);
            title(app.UIAxes_3, 'Title')
            xlabel(app.UIAxes_3, 'X')
            ylabel(app.UIAxes_3, 'Y')
            app.UIAxes_3.TitleFontWeight = 'bold';
            app.UIAxes_3.Position = [8 12 412 206];

            % Create Tab_4
            app.Tab_4 = uitab(app.TabGroup2);
            app.Tab_4.Title = 'ÿÿÿÿÿ';

            % Create UIAxes_4
            app.UIAxes_4 = uiaxes(app.Tab_4);
            title(app.UIAxes_4, 'Title')
            xlabel(app.UIAxes_4, 'X')
            ylabel(app.UIAxes_4, 'Y')
            app.UIAxes_4.TitleFontWeight = 'bold';
            app.UIAxes_4.Position = [8 12 412 206];

            % Show the figure after all components are created
            app.UIFigure.Visible = 'on';
        end
    end

    % App creation and deletion
    methods (Access = public)

        % Construct app
        function app = circuit_exported

            % Create UIFigure and components
            createComponents(app)

            % Register the app with App Designer
            registerApp(app, app.UIFigure)

            % Execute the startup function
            runStartupFcn(app, @startupFcn)

            if nargout == 0
                clear app
            end
        end

        % Code that executes before app deletion
        function delete(app)

            % Delete UIFigure when app is deleted
            delete(app.UIFigure)
        end
    end
end
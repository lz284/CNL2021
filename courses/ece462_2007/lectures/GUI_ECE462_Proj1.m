%ECE462 Project1:  Digital Signal Generator
%Kyurim Rhee 
%Oct 22 2007
%MATLAB Version: 7.4.0.287 (R2007a)

function varargout = GUI_ECE462_Proj1(varargin)
% GUI_ECE462_PROJ1 M-file for GUI_ECE462_Proj1.fig
%      GUI_ECE462_PROJ1, by itself, creates a new GUI_ECE462_PROJ1 or raises the existing
%      singleton*.
%
%      H = GUI_ECE462_PROJ1 returns the handle to a new GUI_ECE462_PROJ1 or the handle to
%      the existing singleton*.
%
%      GUI_ECE462_PROJ1('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in GUI_ECE462_PROJ1.M with the given input arguments.
%
%      GUI_ECE462_PROJ1('Property','Value',...) creates a new GUI_ECE462_PROJ1 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before GUI_ECE462_Proj1_OpeningFunction gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to GUI_ECE462_Proj1_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help GUI_ECE462_Proj1

% Last Modified by GUIDE v2.5 11-Nov-2007 22:14:04

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @GUI_ECE462_Proj1_OpeningFcn, ...
                   'gui_OutputFcn',  @GUI_ECE462_Proj1_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before GUI_ECE462_Proj1 is made visible.
function GUI_ECE462_Proj1_OpeningFcn(hObject, eventdata, handles, varargin)

    set(handles.radiobutton4,'Value', 1);
    set(handles.radiobutton5,'Value', 0);
    
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to GUI_ECE462_Proj1 (see VARARGIN)

% Choose default command line output for GUI_ECE462_Proj1
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes GUI_ECE462_Proj1 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = GUI_ECE462_Proj1_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function edit1_Callback(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit1 as text
%        str2double(get(hObject,'String')) returns contents of edit1 as a double


% --- Executes during object creation, after setting all properties.
function edit1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

%-----------------------------Radio Buttons-------------------------------%
 
    % ------------------------Radio Button1-----------------------%
    function radiobutton4_Callback(hObject, eventdata, handles)
        RadioButton4 = get(handles.radiobutton4, 'Value');
        if RadioButton4 == 1
            set(handles.radiobutton5,'Value', 0);
        end
    % ------------------------Radio Button2-----------------------%
    function radiobutton5_Callback(hObject, eventdata, handles)
        RadioButton5 = get(handles.radiobutton5, 'Value');
        if RadioButton5 == 1
            set(handles.radiobutton4,'Value', 0);            
        end
        
%-------------------------------------------------------------------------%
        
% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
        
        %Global Variables
        ON = 1;
        OFF = 0;
        NumBits = 12; %bits
        %L = 2;      %sets the sampling rate
        L = str2double(get(handles.edit15, 'String'));
        d = 1/L;      %sampling Period
        dom = 0:d:12-d;
        ArrayZero =     [zeros(1,L)];
        ArrayOne =      [ones(1,L)];
        ArrayDownUp =   [zeros(1,L/2), ones(1,L/2)];
        ArrayUpDown =   [ones(1,L/2), zeros(1,L/2)];

        %--------------------- Check the Radio Button ---------------------%
        RadioButtonRand = get(handles.radiobutton4, 'Value');
        RadioButtonType = get(handles.radiobutton5, 'Value');
        
        if RadioButtonType == ON        % read the typed in Binary Input
            z = get(handles.edit17, 'String');
            
            if length(z) == 12
                Input = [str2double(z(1,1)), str2double(z(1,2)), str2double(z(1,3)), str2double(z(1,4)), str2double(z(1,5)), str2double(z(1,6)), str2double(z(1,7)), str2double(z(1,8)), str2double(z(1,9)), str2double(z(1,10)), str2double(z(1,11)), str2double(z(1,12))]
                set(handles.edit18,'String', 'User Selected Signal Produced');
                
                
                
%-------------------------------------------------------------------------%
%-------------------------------------------------------------------------%            
            %--------------------- NRZ-Level -------------------%
        axes(handles.axes1);

        for n = 1:NumBits
            if Input(1,n) == 0
                Signal(1,  L*n-L+1 : L*n) = ArrayZero;

            else
                Signal(1,  L*n-L+1 : L*n) = ArrayOne;

            end
        end
        plot(dom, Signal, 'r') ;axis([0 NumBits -1 2]); grid on

        %--------------------- NRZ-Mark -------------------%
        axes(handles.axes2)

        SignalTemp(1:L) = ArrayZero;
        count = 1;
        for n = 1:NumBits
            if Input(1,n) == 0%Input(1,n+1)
                %Signal(1,  L*n+1 : L*n+L) = 
                SignalTemp(1,  L*n+1 : L*n+L) = SignalTemp(1,  L*n-L+1 : L*n);

            else
                V = SignalTemp(1, L*n)- (-1)^count;
                for v = 1:L
                    ArrayV(1, v) = V;
                end
                SignalTemp(1,  L*n+1 : L*n+L) = ArrayV;
                count = 1 + count;
            end
        end
        Signal = SignalTemp(1, L+1:length(SignalTemp));

        plot(dom, Signal, 'r') ;axis([0 NumBits -1 2]); grid on
        
        
        %--------------------- NRZ-Space -------------------%
        axes(handles.axes3)

        SignalTemp(1:L) = ArrayZero;
        count = 1;
        for n = 1:NumBits
            if Input(1,n) == 1%Input(1,n+1)
                %Signal(1,  L*n+1 : L*n+L) = 
                SignalTemp(1,  L*n+1 : L*n+L) = SignalTemp(1,  L*n-L+1 : L*n);

            else
                V = SignalTemp(1, L*n)- (-1)^count;
                for v = 1:L
                    ArrayV(1, v) = V;
                end
                SignalTemp(1,  L*n+1 : L*n+L) = ArrayV;
                count = 1 + count;
            end
        end
        Signal = SignalTemp(1, L+1:length(SignalTemp));

        plot(dom, Signal, 'r') ;axis([0 NumBits -1 2]); grid on
         
        %--------------------- BIPOLAR(AMI) -------------------%
        axes(handles.axes4);
        
        count = 1;
        for n = 1:NumBits
            if Input(1,n) == 0
                Signal(1,  L*n-L+1 : L*n) = ArrayZero;

            else
                Signal(1,  L*n-L+1 : L*n) = -(-1)^count*ArrayOne;
                count = count+1;

            end
        end
        plot(dom, Signal, 'r') ;axis([0 NumBits -2 2]); grid on

        
        
        %--------------------- RZ -------------------%
        axes(handles.axes5);

        for n = 1:NumBits
            if Input(1,n) == 1
                Signal(1,  L*n-L+1 : L*n) = ArrayUpDown;

            else
                Signal(1,  L*n-L+1 : L*n) = ArrayZero;

            end
        end
        plot(dom, Signal, 'r') ;axis([0 NumBits -1 2]); grid on
        
        
        %--------------------- BIPOLAR(RZ) -------------------%
        axes(handles.axes6);
        
        count = 1;
        for n = 1:NumBits
            if Input(1,n) == 0
                Signal(1,  L*n-L+1 : L*n) = ArrayZero;

            else
                Signal(1,  L*n-L+1 : L*n) = -(-1)^count*ArrayUpDown;
                count = count+1;

            end
        end
        plot(dom, Signal, 'r') ;axis([0 NumBits -2 2]); grid on

        %--------------------- Manchester -------------------%
        axes(handles.axes7);

        for n = 1:NumBits
            if Input(1,n) == 1
                Signal(1,  L*n-L+1 : L*n) = ArrayDownUp;

            else
                Signal(1,  L*n-L+1 : L*n) = ArrayUpDown;

            end
        end
        plot(dom, Signal, 'r') ;axis([0 NumBits -1 2]); grid on

        
        %--------------------- Differential Manchester -------------------%
        axes(handles.axes8);
        
        SignalTemp(1:L) = ArrayDownUp;
        count = 1;
        for n = 1:NumBits
            if Input(1,n) == 0%Input(1,n+1)
                SignalTemp(1,  L*n+1 : L*n+L) = SignalTemp(1,  L*n-L+1 : L*n);

            else
                if SignalTemp(1,  L*n-L+1 : L*n) == ArrayDownUp
                    SignalTemp(1,  L*n+1 : L*n+L) = ArrayUpDown;
                else
                    SignalTemp(1,  L*n+1 : L*n+L) = ArrayDownUp;
                end
            end
        end
        SignalNeg = SignalTemp(1, L+1:length(SignalTemp));
        Signal = -SignalNeg+1;
        plot(dom, Signal, 'r') ;axis([0 NumBits -1 2]); grid on
            
        set(handles.edit3,'String', num2str(Input(1)));     %bit0
        set(handles.edit4,'String', num2str(Input(2)));     %bit1
        set(handles.edit5,'String', num2str(Input(3)));     %bit2
        set(handles.edit6,'String', num2str(Input(4)));     %bit3
        set(handles.edit7,'String', num2str(Input(5)));     %bit4
        set(handles.edit8,'String', num2str(Input(6)));     %bit5
        set(handles.edit9,'String', num2str(Input(7)));     %bit6
        set(handles.edit10,'String', num2str(Input(8)));    %bit7
        set(handles.edit11,'String', num2str(Input(9)));    %bit8
        set(handles.edit12,'String', num2str(Input(10)));   %bit9
        set(handles.edit13,'String', num2str(Input(11)));   %bit10
        set(handles.edit14,'String', num2str(Input(12)));   %bit11
        
%-------------------------------------------------------------------------%
%-------------------------------------------------------------------------%

            else
                set(handles.edit18,'String', 'Error:  Check Input');
            end
        end

        

        if RadioButtonRand == ON                      % uses the Randomly generated Binary Input
            %------------------Random Input Generator-------------------%
            Input = round(rand(1,12))
            set(handles.edit1,'String', num2str(Input));
            set(handles.edit18,'String', 'Random Signal Produced');

            
%-------------------------------------------------------------------------%
% Signal Generating code repeated for case 2
%-------------------------------------------------------------------------%            
            %--------------------- NRZ-Level -------------------%
        axes(handles.axes1);

        for n = 1:NumBits
            if Input(1,n) == 0
                Signal(1,  L*n-L+1 : L*n) = ArrayZero;

            else
                Signal(1,  L*n-L+1 : L*n) = ArrayOne;

            end
        end
        plot(dom, Signal, 'r') ;axis([0 NumBits -1 2]); grid on

        %--------------------- NRZ-Mark -------------------%
        axes(handles.axes2)

        SignalTemp(1:L) = ArrayZero;
        count = 1;
        for n = 1:NumBits
            if Input(1,n) == 0%Input(1,n+1)
                %Signal(1,  L*n+1 : L*n+L) = 
                SignalTemp(1,  L*n+1 : L*n+L) = SignalTemp(1,  L*n-L+1 : L*n);

            else
                V = SignalTemp(1, L*n)- (-1)^count;
                for v = 1:L
                    ArrayV(1, v) = V;
                end
                SignalTemp(1,  L*n+1 : L*n+L) = ArrayV;
                count = 1 + count;
            end
        end
        Signal = SignalTemp(1, L+1:length(SignalTemp));

        plot(dom, Signal, 'r') ;axis([0 NumBits -1 2]); grid on
        
        
        %--------------------- NRZ-Space -------------------%
        axes(handles.axes3)

        SignalTemp(1:L) = ArrayZero;
        count = 1;
        for n = 1:NumBits
            if Input(1,n) == 1%Input(1,n+1)
                %Signal(1,  L*n+1 : L*n+L) = 
                SignalTemp(1,  L*n+1 : L*n+L) = SignalTemp(1,  L*n-L+1 : L*n);

            else
                V = SignalTemp(1, L*n)- (-1)^count;
                for v = 1:L
                    ArrayV(1, v) = V;
                end
                SignalTemp(1,  L*n+1 : L*n+L) = ArrayV;
                count = 1 + count;
            end
        end
        Signal = SignalTemp(1, L+1:length(SignalTemp));

        plot(dom, Signal, 'r') ;axis([0 NumBits -1 2]); grid on
         
        %--------------------- BIPOLAR(AMI) -------------------%
        axes(handles.axes4);
        
        count = 1;
        for n = 1:NumBits
            if Input(1,n) == 0
                Signal(1,  L*n-L+1 : L*n) = ArrayZero;

            else
                Signal(1,  L*n-L+1 : L*n) = -(-1)^count*ArrayOne;
                count = count+1;

            end
        end
        plot(dom, Signal, 'r') ;axis([0 NumBits -2 2]); grid on

        
        
        %--------------------- RZ -------------------%
        axes(handles.axes5);

        for n = 1:NumBits
            if Input(1,n) == 1
                Signal(1,  L*n-L+1 : L*n) = ArrayUpDown;

            else
                Signal(1,  L*n-L+1 : L*n) = ArrayZero;

            end
        end
        plot(dom, Signal, 'r') ;axis([0 NumBits -1 2]); grid on
        
        
        %--------------------- BIPOLAR(RZ) -------------------%
        axes(handles.axes6);
        
        count = 1;
        for n = 1:NumBits
            if Input(1,n) == 0
                Signal(1,  L*n-L+1 : L*n) = ArrayZero;

            else
                Signal(1,  L*n-L+1 : L*n) = -(-1)^count*ArrayUpDown;
                count = count+1;

            end
        end
        plot(dom, Signal, 'r') ;axis([0 NumBits -2 2]); grid on

        %--------------------- Manchester -------------------%
        axes(handles.axes7);

        for n = 1:NumBits
            if Input(1,n) == 1
                Signal(1,  L*n-L+1 : L*n) = ArrayDownUp;

            else
                Signal(1,  L*n-L+1 : L*n) = ArrayUpDown;

            end
        end
        plot(dom, Signal, 'r') ;axis([0 NumBits -1 2]); grid on

        
        %--------------------- Differential Manchester -------------------%
        axes(handles.axes8);
        
        SignalTemp(1:L) = ArrayDownUp;
        count = 1;
        for n = 1:NumBits
            if Input(1,n) == 0%Input(1,n+1)
                SignalTemp(1,  L*n+1 : L*n+L) = SignalTemp(1,  L*n-L+1 : L*n);

            else
                if SignalTemp(1,  L*n-L+1 : L*n) == ArrayDownUp
                    SignalTemp(1,  L*n+1 : L*n+L) = ArrayUpDown;
                else
                    SignalTemp(1,  L*n+1 : L*n+L) = ArrayDownUp;
                end
            end
        end
        SignalNeg = SignalTemp(1, L+1:length(SignalTemp));
        Signal = -SignalNeg+1;
        plot(dom, Signal, 'r') ;axis([0 NumBits -1 2]); grid on
            
        set(handles.edit3,'String', num2str(Input(1)));     %bit0
        set(handles.edit4,'String', num2str(Input(2)));     %bit1
        set(handles.edit5,'String', num2str(Input(3)));     %bit2
        set(handles.edit6,'String', num2str(Input(4)));     %bit3
        set(handles.edit7,'String', num2str(Input(5)));     %bit4
        set(handles.edit8,'String', num2str(Input(6)));     %bit5
        set(handles.edit9,'String', num2str(Input(7)));     %bit6
        set(handles.edit10,'String', num2str(Input(8)));    %bit7
        set(handles.edit11,'String', num2str(Input(9)));    %bit8
        set(handles.edit12,'String', num2str(Input(10)));   %bit9
        set(handles.edit13,'String', num2str(Input(11)));   %bit10
        set(handles.edit14,'String', num2str(Input(12)));   %bit11
        
%-------------------------------------------------------------------------%
%-------------------------------------------------------------------------%
        end

            
            

        
% --- Executes on button press in radiobutton4.
function radiobutton4_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton4
    a = get(hObject,'Value')        
        
        
function edit2_Callback(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit2 as text
%        str2double(get(hObject,'String')) returns contents of edit2 as a double


% --- Executes during object creation, after setting all properties.
function edit2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end





function edit3_Callback(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit3 as text
%        str2double(get(hObject,'String')) returns contents of edit3 as a double


% --- Executes during object creation, after setting all properties.
function edit3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end





function edit4_Callback(hObject, eventdata, handles)
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit4 as text
%        str2double(get(hObject,'String')) returns contents of edit4 as a double


% --- Executes during object creation, after setting all properties.
function edit4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit5_Callback(hObject, eventdata, handles)
% hObject    handle to edit5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit5 as text
%        str2double(get(hObject,'String')) returns contents of edit5 as a double


% --- Executes during object creation, after setting all properties.
function edit5_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit6_Callback(hObject, eventdata, handles)
% hObject    handle to edit6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit6 as text
%        str2double(get(hObject,'String')) returns contents of edit6 as a double


% --- Executes during object creation, after setting all properties.
function edit6_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit7_Callback(hObject, eventdata, handles)
% hObject    handle to edit7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit7 as text
%        str2double(get(hObject,'String')) returns contents of edit7 as a double


% --- Executes during object creation, after setting all properties.
function edit7_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit8_Callback(hObject, eventdata, handles)
% hObject    handle to edit8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit8 as text
%        str2double(get(hObject,'String')) returns contents of edit8 as a double


% --- Executes during object creation, after setting all properties.
function edit8_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit9_Callback(hObject, eventdata, handles)
% hObject    handle to edit9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit9 as text
%        str2double(get(hObject,'String')) returns contents of edit9 as a double


% --- Executes during object creation, after setting all properties.
function edit9_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit10_Callback(hObject, eventdata, handles)
% hObject    handle to edit10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit10 as text
%        str2double(get(hObject,'String')) returns contents of edit10 as a double


% --- Executes during object creation, after setting all properties.
function edit10_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit11_Callback(hObject, eventdata, handles)
% hObject    handle to edit11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit11 as text
%        str2double(get(hObject,'String')) returns contents of edit11 as a double


% --- Executes during object creation, after setting all properties.
function edit11_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit12_Callback(hObject, eventdata, handles)
% hObject    handle to edit12 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit12 as text
%        str2double(get(hObject,'String')) returns contents of edit12 as a double


% --- Executes during object creation, after setting all properties.
function edit12_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit12 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit13_Callback(hObject, eventdata, handles)
% hObject    handle to edit13 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit13 as text
%        str2double(get(hObject,'String')) returns contents of edit13 as a double


% --- Executes during object creation, after setting all properties.
function edit13_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit13 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit14_Callback(hObject, eventdata, handles)
% hObject    handle to edit14 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit14 as text
%        str2double(get(hObject,'String')) returns contents of edit14 as a double


% --- Executes during object creation, after setting all properties.
function edit14_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit14 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end





function edit15_Callback(hObject, eventdata, handles)
% hObject    handle to edit15 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit15 as text
%        str2double(get(hObject,'String')) returns contents of edit15 as a double


% --- Executes during object creation, after setting all properties.
function edit15_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit15 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end




% --- Executes on button press in radiobutton5.
function radiobutton5_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton5



function edit16_Callback(hObject, eventdata, handles)
% hObject    handle to edit16 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit16 as text
%        str2double(get(hObject,'String')) returns contents of edit16 as a double


% --- Executes during object creation, after setting all properties.
function edit16_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit16 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit17_Callback(hObject, eventdata, handles)
% hObject    handle to edit17 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit17 as text
%        str2double(get(hObject,'String')) returns contents of edit17 as a double


% --- Executes during object creation, after setting all properties.
function edit17_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit17 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit18_Callback(hObject, eventdata, handles)
% hObject    handle to edit18 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit18 as text
%        str2double(get(hObject,'String')) returns contents of edit18 as a double


% --- Executes during object creation, after setting all properties.
function edit18_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit18 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



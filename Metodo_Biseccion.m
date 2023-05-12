function varargout = Metodo_Biseccion(varargin)
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Metodo_Biseccion_OpeningFcn, ...
                   'gui_OutputFcn',  @Metodo_Biseccion_OutputFcn, ...
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

function Metodo_Biseccion_OpeningFcn(hObject, eventdata, handles, varargin)
handles.output = hObject;
guidata(hObject, handles);

% UIWAIT makes Metodo_Biseccion wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Metodo_Biseccion_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function a_e_Callback(hObject, eventdata, handles)
% hObject    handle to a_e (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of a_e as text
%        str2double(get(hObject,'String')) returns contents of a_e as a double


% --- Executes during object creation, after setting all properties.
function a_e_CreateFcn(hObject, eventdata, handles)
% hObject    handle to a_e (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function b_e_Callback(hObject, eventdata, handles)
% hObject    handle to b_e (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of b_e as text
%        str2double(get(hObject,'String')) returns contents of b_e as a double


% --- Executes during object creation, after setting all properties.
function b_e_CreateFcn(hObject, eventdata, handles)
% hObject    handle to b_e (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function t_2_Callback(hObject, eventdata, handles)
% hObject    handle to t_2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of t_2 as text
%        str2double(get(hObject,'String')) returns contents of t_2 as a double


% --- Executes during object creation, after setting all properties.
function t_2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to t_2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function f_e_Callback(hObject, eventdata, handles)
global f_e x;
syms x a b m;
f_e = eval(get(gcbo,'string'));
fa=subs(f_e,a);
fb=subs(f_e,b);
fm=subs(f_e,m);


% --- Executes during object creation, after setting all properties.
function f_e_CreateFcn(hObject, eventdata, handles)
% hObject    handle to f_e (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
global f_e x a b m;
syms x a b m;

F_e=findobj(gcbf,'Tag','f_e');
t =str2double(get(handles.t_2,'String'))
fa=subs(f_e,a);
fb=subs(f_e,b);
fm=subs(f_e,m);
a =str2double(get(handles.a_e,'String'))
b =str2double(get(handles.b_e,'String'))

%grafica de la funcion
axes(handles.axes2);
x=[(a):0.001:(b)];
y=eval(f_e);
plot(x,y,'b','LineWidth',2)
hold on
fplot('0',[(a),(b)],':r')
hold off
%plot(X,V,'LineWidth',2);

xlabel('x')
ylabel('y')
grid on
n=0;

%ejecucion del algoritmo

while n<100;
       n = n+1;
       m=(a+b)/2;
       fi=eval(fa);
       ff=eval(fb);
       fd=eval(fm);
       N(n)=n;
       A(n)=a;
       B(n)=b;
       if fi*fd >0
           a=m;
           
       elseif ff*fd >0
           b=m;     
       end
   
    e = abs(a-b);
    E(n)=e;
    M(n)=m;
    F(n)=fi;
    G(n)=ff;
    X(n)=fd;
     if e <= t;
         break
     end
   
end

MX=[M;A;B;F;G;E]';


%Escrive parametros de salida en los static-text
m
set(handles.x_s,'String',[num2str(m)])
set(handles.tabla,'data',MX)
% para el grafico



function x_s_Callback(hObject, eventdata, handles)
% hObject    handle to x_s (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of x_s as text
%        str2double(get(hObject,'String')) returns contents of x_s as a double


% --- Executes during object creation, after setting all properties.
function x_s_CreateFcn(hObject, eventdata, handles)
% hObject    handle to x_s (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function pushbutton2_Callback(hObject, eventdata, handles)
clear;
clear global;
F_e=findobj(gcbf,'Tag','f_e');
A_e=findobj(gcbf,'Tag','a_e');
B_e=findobj(gcbf,'Tag','b_e');
T_e=findobj(gcbf,'Tag','t_2');
X_s=findobj(gcbf,'Tag','x_s');
limpiar= ' ' ;
set(F_e,'string',limpiar);
set(A_e,'string',limpiar);
set(B_e,'string',limpiar);
set(T_e,'string',limpiar);
set(X_s,'string',limpiar);



function pushbutton3_Callback(hObject, eventdata, handles)
close(gcbf)


function figure1_CloseRequestFcn(hObject, eventdata, handles)
Preg = questdlg ('Desea salir de la aplicacion?',...
    'SALIR','Si','No','No');
if strcmp(Preg,'No');
    return;
end
delete(hObject);

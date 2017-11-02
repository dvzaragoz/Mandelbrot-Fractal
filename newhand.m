function newhand(hObject, handles)

blank=imread('Cards/blank.jpg');
card=image(blank, 'Parent',handles.c1);
axis(handles.c1, 'off');
card=image(blank, 'Parent',handles.c2);
axis(handles.c2, 'off');
card=image(blank, 'Parent',handles.c3);
axis(handles.c3, 'off');
card=image(blank, 'Parent',handles.c4);
axis(handles.c4, 'off');
card=image(blank, 'Parent',handles.c5);
axis(handles.c5, 'off');
card=image(blank, 'Parent',handles.c6);
axis(handles.c6, 'off');
card=image(blank, 'Parent',handles.c7);
axis(handles.c7, 'off');
card=image(blank, 'Parent',handles.c8);
axis(handles.c8, 'off');
card=image(blank, 'Parent',handles.c9);
axis(handles.c9, 'off');
card=image(blank, 'Parent',handles.c10);
axis(handles.c10, 'off');
card=image(blank, 'Parent',handles.c11);
axis(handles.c11, 'off');
card=image(blank, 'Parent',handles.c12);
axis(handles.c12, 'off');
card=image(blank, 'Parent',handles.c13);
axis(handles.c13, 'off');
card=image(blank, 'Parent',handles.c14);
axis(handles.c14, 'off');
card=image(blank, 'Parent',handles.c15);
axis(handles.c15, 'off');

handles.faceup(1)=0;
handles.faceup(2)=0;
handles.faceup(3)=0;
handles.faceup(4)=0;
handles.faceup(5)=0;
handles.faceup(6)=0;
handles.faceup(7)=0;
handles.faceup(8)=0;
handles.faceup(9)=0;
handles.faceup(10)=0;
handles.faceup(11)=0;
handles.faceup(12)=0;
handles.faceup(13)=0;
handles.faceup(14)=0;
handles.faceup(15)=0;

guidata(hObject, handles);


set(handles.pText, 'String', '');
set(handles.c1Text, 'String', '');
set(handles.c2Text, 'String', '');
set(handles.c3Text, 'String', '');
set(handles.c4Text, 'String', '');
set(handles.betText, 'String', '0');


set(handles.betButton, 'String', 'Ante');
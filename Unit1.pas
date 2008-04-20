unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, ComCtrls, ExtCtrls, StdCtrls;

type
  TForm1 = class(TForm)
    MainMenu1: TMainMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    procedure N1Click(Sender: TObject);
    procedure Panel1Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var mas: array [0..5, 0..5] of TPanel;    i, j, q, x, y:integer;
n: string; a: Integer;

  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.N1Click(Sender: TObject);

begin






Randomize;
  for i:=1 to 4 do
    for j:=1 to 4 do begin
    mas[i,j]:=Tpanel.create(form1);
    mas[i,j].Parent:=form1;
    mas[i,j].width:=clientwidth div 4;
    mas[i,j].height:=clientheight div 4;
    mas[i,j].left:=(i-1)*mas[i,j].width;
    mas[i,j].top:=(j-1)*mas[i,j].height;
    mas[i,j].caption:=' ';
    mas[i,j].Font.Size:=24;
    mas[i,j].OnClick:=Panel1Click;
    a:=0;    Caption:='Пятнашки';
  end;

  for i:=1 to 15 do begin
   repeat
    x:=random(4)+1;
    y:=random(4)+1;
   until mas[x,y].caption=' ';
   mas[x,y].Caption:=inttostr(i);

  end;
end;

procedure TForm1.Panel1Click(Sender: TObject);
var nstr, nstlb: integer;
begin
//
 nstr:=(sender as TPanel).top div (sender as TPanel).Height +1;
 nstlb:=(sender as TPanel).Left div (sender as TPanel).Width+1;


// mas[]

  if (mas[nstlb+1,nstr].caption=' ') then begin
    mas[nstlb+1,nstr].caption:=mas[nstlb,nstr].caption; mas[nstlb,nstr].caption:=' ';
  end;
  if (mas[nstlb-1,nstr].caption=' ') then begin
    mas[nstlb-1,nstr].caption:=mas[nstlb,nstr].caption; mas[nstlb,nstr].caption:=' ';
  end;
  if (mas[nstlb,nstr+1].caption=' ') then begin
    mas[nstlb,nstr+1].caption:=mas[nstlb,nstr].caption; mas[nstlb,nstr].caption:=' ';
  end;
  if (mas[nstlb,nstr-1].caption=' ') then begin
    mas[nstlb,nstr-1].caption:=mas[nstlb,nstr].caption; mas[nstlb,nstr].caption:=' ';
  end;
  a:=a+1;    Caption:=IntToStr(a);
  //mas[nstr,nstlb].Caption:='#';
        if (mas[1,1].caption='1') and (mas[2,1].caption='2') and (mas[3,1].caption='3') and (mas[4,1].caption='4') and
     (mas[1,2].caption='5') and (mas[2,2].caption='6') and (mas[3,2].caption='7') and (mas[4,2].caption='8') and
     (mas[1,3].caption='9') and (mas[2,3].caption='10') and (mas[3,3].caption='11') and (mas[4,3].caption='12') and
     (mas[1,4].caption='13') and (mas[2,4].caption='14') and (mas[3,4].caption='15') and (mas[4,4].caption=' ') then caption:='YOU WON'+' '+IntToStr(a);

     end;


procedure TForm1.N2Click(Sender: TObject);
begin
Application.Terminate;
end;

end.

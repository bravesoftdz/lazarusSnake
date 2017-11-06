unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, ExtCtrls,
  StdCtrls;

type

  { TForm1 }

  TForm1 = class(TForm)
    Restart: TButton;
    GameOver: TLabel;
    Score: TLabel;
    Player1: TShape;
    apple: TShape;
    Shape1: TShape;
    Timer1: TTimer;
    procedure FormCreate(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure RestartClick(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
  private
    vx,vy:integer;
    speed:integer;
    player_x:integer;
    player_y:integer;
    apple_x:integer;
    apple_y:integer;
    apple_r:integer;
    player_r:integer;
    n:integer;
    r:integer;
    { private declarations }
  public
    { public declarations }
  end;

var
  Form1: TForm1;


implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.Timer1Timer(Sender: TObject);

begin
   Player1.top:=Player1.top-speed*vy;
   Player1.left:=Player1.left+speed*vx;
   Player_x:= round (player1.left+(player1.width/2));
   Player_y:= round (player1.top+(player1.height/2));
   apple_x:= round (apple.left+(apple.width/2));
   apple_y:= round (apple.top+(apple.height/2));
   apple_r:= round (apple.width/2);
   player_r:= round (player1.width/2);
   r:=round(Sqrt(sqr(player_x-apple_x)+sqr(player_y-apple_y)));
   if r <= (apple_r+player_r) then
   begin
      apple.Top:= random (461)+20;
      apple.Left:= random (661)+20;
      n:=n+10;
      score.caption:= 'Очки: ' + inttostr(n);
      if (n mod 100=0)then
         speed:= speed+2;

   end;


   if (player1.Left+player1.Width >= 700)
   or (player1.Left+player1.Width <=0)
   or (player1.top+player1.Width <=10)
   or (player1.top+player1.height >= 510) then
   begin
      player1.Left:= 900;
      Gameover.visible:=true;
      restart.visible:=true;
   end;
       end;
procedure TForm1.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState
  );
begin
  If (key=38) then
  begin
      vx:=0;
      vy:=1;
  end;
   If (key=40) then
   begin
      vx:=0;
      vy:=-1;
   end;
   If (key=37) then
   begin
      vx:=-1;
      vy:=0;
   end;
   If (key=39) then
   begin
      vx:=1;
      vy:=0;
   end;

end;

procedure TForm1.FormKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
begin

end;

procedure TForm1.RestartClick(Sender: TObject);
begin
      player1.Left:= 350;
      player1.Top:= 240;
      n:= 0;
      score.caption:= 'Очки: ' + inttostr(n);
      speed:=2;
      Gameover.visible:=false;
      restart.visible:=false;
end;

procedure TForm1.FormCreate(Sender: TObject);
var Shape:TShape;
begin
   speed:=5;

      shape:=TShape.Create(Form1);

          Shape.Name:='Shape123';
          Shape.Width:=20;
          Shape.Height:=20;
          Shape.Left:=100;
          Shape.Top:=100;
          shape.Shape:=stRectangle;
           Shape.Parent:=Form1;
end;

end.


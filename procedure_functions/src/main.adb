with Ada.Text_IO, Ada.Integer_Text_IO;
use Ada.Text_IO, Ada.Integer_Text_IO;

-- a small demo that shows the way functions and peocedures work
-- and take a parameters as input

procedure Main is

   -- procedure takes parameters, but does not return any value
   -- 'in' specificator means that a value can be used, but not changed
   -- 'out' specificator means that a value can be changed, but not processed
   -- 'in out' gives both possibilities

   -- example of procedure

   procedure Proc(A : out Integer) is
      B : Integer := 2;
   begin
      null;
   end;

   -- example of function

   function Func return Integer is
   begin
      return (2);
   end;

   -- exmaple of how case works

   procedure GuessA(Val : in Integer) is
   begin
      case Val is
         when 1 => Put_Line("Val is 1");                           -- if Val is = 1
         when 2 .. 10 => Put_Line("Val is in range from 2 to 10"); -- Val >= 2 and Val <= 10
         when others => Put_Line("I do not know what is a value"); -- defalut case
      end case;
   end;

begin

   -- if else oncstruction

   if 2 > 3 then
      Put_Line("2 > 3");
   elsif 2 < 3 then
         Put_Line("2 < 3");
      else
         Put_Line("else");
   end if;
end Main;

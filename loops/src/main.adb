with Ada.Text_IO, Ada.Integer_Text_IO;
use Ada.Text_IO, Ada.Integer_Text_IO;

procedure Main is

   -- infinite loop

   procedure InfLoop is
   begin
      loop
         Put_Line("I am an infinite loop!");
      end loop;
   end;

   X : Integer;

begin

   -- example of an loop with exit mode

   loop
      Get(X);
      exit when X = 0;
      Put(X * X);
      New_Line;
   end loop;

   -- while loop

   Get(X);
   while X < 20
   loop
      Put(X);
      X := X + 1;
   end loop;

   -- for loop

   for Count in 1 .. 10
   loop
      Put_Line("Hello!");
   end loop;

   -- reverse loop

   for Count in reverse 1 .. 10
   loop
      Put(X);
      New_Line;
   end loop;

end Main;

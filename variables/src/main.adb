with Ada.Text_IO, Ada.Integer_Text_IO;
use Ada.Text_IO, Ada.Integer_Text_IO;

-- example of a a simple procedure that has an procedure in it

procedure Main is

   -- built in procedure
   -- in out means that the variable will passed to the procedure and and can be changed in it

   procedure Double(Item : in out Integer) is
      begin
      Item := Item * 2;
   end Double;


   -- local Integer variable X

   X : Integer := 1;

   -- start of the Main procedure

begin

   -- this program will cause an exception
   -- overflow will occur

   loop
      Put(X); -- Put() prints passed to it Integer
      Double(X);
   end loop;

end Main;

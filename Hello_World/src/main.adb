
-- A first Hello, World program

with Ada.Text_IO, Ada.Integer_Text_IO;
use Ada.Text_IO, Ada.Integer_Text_IO;

-- use means that Ada.Text_IO will be viewed
-- we do not need write Ada.Text_IO.Putline("");

procedure main is
begin
   Put_Line("Hello, World");
end main;

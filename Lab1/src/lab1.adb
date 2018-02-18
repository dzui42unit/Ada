with Ada.Containers.Vectors, Ada.Text_IO, Ada.Integer_Text_IO;
use Ada.Containers, Ada.Text_IO, Ada.Integer_Text_IO;


procedure Lab1 is

   -- the way a vector in ADA is declared

   package vec is new Vectors(Natural, Integer);

   use vec;

   -- create a variable of vectors

   A,B : vec.Vector;

   -- function for assigning a vector

   procedure AssignVector(A : out vec.Vector) is
      N : Natural;
      Temp : Integer;
   begin
      Put("ENTER A NUMBER OF ELEMENTS IN VECTOR: ");
      Get(N);
      for Counter in 1 .. N
      loop
         Put("Enter element #");
         Put(Counter);
         Put(" ");
         Get(Temp);
         A.Append(Temp);
         end loop;
   end AssignVector;

   -- prints the content of a vector

   procedure PrintElem(Position : Cursor) is
   begin
      Put(Element(Position));
   end PrintElem;

   procedure PrintVector(V : in vec.Vector) is
   begin
      Put_Line("CONTENT OF A VECTOR");
      V.Iterate(PrintElem'Access);
      New_Line;
   end;

   C : vec.Vector;

begin
   AssignVector(A);
   AssignVector(B);
   PrintVector(A);
   PrintVector(B);
   null;
end Lab1;

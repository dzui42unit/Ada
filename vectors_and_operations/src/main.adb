with Ada.Text_IO, Ada.Integer_Text_IO;
use Ada.Text_IO, Ada.Integer_Text_IO;

procedure Main is

   -- declaring a vector type (array of integers)

   type vector is array(1 .. 5) of Integer;

   -- function that sets the values to the zero, resets vector

   procedure ResetVector(Vec : in out vector) is
   begin
      for Counter in 1 .. Vec'Length
      loop
         Vec(Counter) := 0;
      end loop;
   end ResetVector;

   -- prints a vector to the standard output

   procedure PrintVec(A : in vector) is
   begin
      for Counter in 1 .. A'Length
      loop
         Put(A(Counter));
         Put(' ');
      end loop;
      New_Line;
   end PrintVec;

   -- allows to set the values for vector

   procedure AssignVec(A : in out vector) is
   begin
      Put_Line("ASSIGN VECTOR");
      New_Line;
      for Counter in 1 .. A'Length
      loop
         Put("Enter element #");
         Put(Counter);
         Put(" ");
         Get(A(Counter));
      end loop;
   end AssignVec;

   -- function for adding two vectors

   function AddVectors(A, B : in vector ) return vector is

      Result : vector;

   begin
      ResetVector(Result);
      for Counter in 1 .. Result'Length
      loop
         Result(Counter) := A(Counter) + B(Counter);
      end loop;
      null;
      return (Result);
   end AddVectors;

   -- subtract vectors

  function SubVectors(A, B : in vector ) return vector is

      Result : vector;

   begin
      ResetVector(Result);
      for Counter in 1 .. Result'Length
      loop
         Result(Counter) := A(Counter) - B(Counter);
      end loop;
      null;
      return (Result);
   end SubVectors;

   -- multiply vectors

  function MulVectors(A, B : in vector ) return vector is

      Result : vector;

   begin
      ResetVector(Result);
      for Counter in 1 .. Result'Length
      loop
         Result(Counter) := A(Counter) * B(Counter);
      end loop;
      null;
      return (Result);
   end MulVectors;

   -- devide vectors

  function DivVectors(A, B : in vector ) return vector is

      Result : vector;

   begin
      ResetVector(Result);
      for Counter in 1 .. Result'Length
      loop
         if B(Counter) /= 0 then
            Result(Counter) := A(Counter) / B(Counter);
         end if;
      end loop;
      null;
      return (Result);
   end DivVectors;

   -- add a number to a vector

  function AddNbToVec(A : in vector; Nb : in Integer) return vector is

      Result : vector;

   begin
      ResetVector(Result);
      for Counter in 1 .. Result'Length
      loop
         Result(Counter) := A(Counter) + Nb;
      end loop;
      null;
      return (Result);
   end AddNbToVec;

   -- sub a number from a vector

  function SubNbToVec(A : in vector; Nb : in Integer) return vector is

      Result : vector;

   begin
      ResetVector(Result);
      for Counter in 1 .. Result'Length
      loop
         Result(Counter) := A(Counter) - Nb;
      end loop;
      null;
      return (Result);
   end SubNbToVec;

   -- mul a vector on the number

  function MulNbToVec(A : in vector; Nb : in Integer) return vector is

      Result : vector;

   begin
      ResetVector(Result);
      for Counter in 1 .. Result'Length
      loop
         Result(Counter) := A(Counter) * Nb;
      end loop;
      null;
      return (Result);
   end MulNbToVec;

   -- div a vector by a number

  function DivNbToVec(A : in vector; Nb : in Integer) return vector is

      Result : vector;

   begin
      ResetVector(Result);
      if Nb /= 0 then
         for Counter in 1 .. Result'Length
         loop
            Result(Counter) := A(Counter) / Nb;
         end loop;
         null;
      end if;
      return (Result);
   end DivNbToVec;

   A, B, RES : vector;

begin


   AssignVec(A);
   AssignVec(B);
   ResetVector(RES);
   Put_Line("VECTOR A");
   PrintVec(A);
   Put_Line("VECTOR B");
   PrintVec(B);
   Put_Line("VECTOR RES");
   PrintVec(RES);
   Put_Line("VECTOR RES AFTER ADDING A, B");
   RES := AddVectors(A,B);
   PrintVec(RES);
   Put_Line("VECTOR RES AFTER SUB A,B");
   RES := SubVectors(A,B);
   PrintVec(RES);
   Put_Line("VECTOR RES AFTER MUL A,B");
   RES := MulVectors(A,B);
   PrintVec(RES);
   Put_Line("VECTOR RES AFTER DIV A,B");
   RES := DivVectors(A,B);
   PrintVec(RES);
   Put_Line("VECTOR RES AFTER ADD A,Number");
   RES := AddNbToVec(A,12);
   PrintVec(RES);
   Put_Line("VECTOR RES AFTER SUB A,Number");
   RES := SubNbToVec(A,2);
   PrintVec(RES);
   Put_Line("VECTOR RES AFTER MUL A,Number");
   RES := MulNbToVec(A,2);
   PrintVec(RES);
   Put_Line("VECTOR RES AFTER DIV A,Number");
   RES := DIVNbToVec(A,2);
   PrintVec(RES);
   null;
end Main;

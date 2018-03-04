with Ada.Containers.Vectors, Ada.Text_IO, Ada.Integer_Text_IO, Ada.Synchronous_Task_Control;
use Ada.Containers, Ada.Text_IO, Ada.Integer_Text_IO, Ada.Synchronous_Task_Control;



procedure Main is
   type matrix is array (Integer range <>, Integer range <>) of Integer;
   function GetSize return Natural;

   function GetSize return Natural is
     N : Integer;
   begin
      Put("Enter an number of elements in matrix: ");
      Get(N);
      while (N mod 4 /= 0)
      loop
         Put("N SHOULD BE DEVIDED BY 4: ");
         Get(N);
      end loop;
      return (N);
   end;

   N : Natural := GetSize;
   P : Natural := 4;
   H : Natural := N / P;

   S : Integer;

   function  CreateMatrix(N : in out Natural) return matrix;
   procedure AssignMatrix(MA : in out matrix);
   procedure PrintMatrix(MA : in matrix);

   function CreateMatrix(N : in out Natural) return matrix is
   begin
      declare
         MA : matrix(1 .. N, 1 .. N) := (others => (others => 0));
      begin
         return (MA);
      end;
   end CreateMatrix;

   MA : matrix := CreateMatrix(N);
   MB : matrix := CreateMatrix(N);
   MC : matrix := CreateMatrix(N);
   MM : matrix := CreateMatrix(N);
   MK : matrix := CreateMatrix(N);
   MC_MUL_MK : matrix := CreateMatrix(N);

   procedure AssignMatrix(MA : in out matrix) is
   begin
         for i in MA'First(1) .. MA'Last(1)
         loop
            for j in MA'First(2) .. MA'Last(2)
            loop
                Put("Enter element ");
                Put(i);
                Put(" ");
                Put(j);
                Put(" ");
                Get(MA(i, j));
                MA(i, j) := i;
            end loop;
         end loop;
   end AssignMatrix;

   procedure PrintMatrix(MA : in matrix) is
   begin
      Put_Line("MATRIX");
      for i in MA'First(1) .. MA'Last(1)
         loop
            for j in MA'First(2) .. MA'Last(2)
            loop
               Put(MA(i, j));
         end loop;
         New_Line;
      end loop;
   end PrintMatrix;

   procedure MultiplyMatrix(M1, M2, RES : in out matrix; S_POS, E_POS : Natural) is
   begin
      for i in 1 .. N
      loop
         for j in S_POS .. E_POS
         loop
            for k in 1 .. N
            loop
               RES(i, j) := RES(i,j) + M1(i, k) * M2(k, j);
            end loop;
      end loop;
   end loop;
   end MultiplyMatrix;
begin
   --  Insert code here.
   null;
end Main;

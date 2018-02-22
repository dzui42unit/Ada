with Ada.Containers.Vectors, Ada.Text_IO, Ada.Integer_Text_IO;
use Ada.Containers, Ada.Text_IO, Ada.Integer_Text_IO;

procedure Lab1 is

   -- N is the size of matrix
   -- matrix is a two dimensional array of integers

   type matrix is array (Integer range <>, Integer range <>) of Integer;
   N : Natural := 0;

   function CreateMatrix(N : in out Natural) return matrix is
   begin
      --if N = 0 then
         Put("Enter a size of matrix: ");
         Get(N);
      --end if;
      declare
         MA : matrix(1 .. N, 1 .. N) := (others => (others => 0));
         begin
         for i in MA'First(1) .. MA'Last(1)
         loop
            for j in MA'First(2) .. MA'Last(2)
            loop
               Get(MA(i, j));
            end loop;
         end loop;
         return (MA);
      end;
   end CreateMatrix;

   procedure PrintMatrix(MA : in matrix) is
   begin
      for i in MA'First(1) .. MA'Last(1)
         loop
            for j in MA'First(2) .. MA'Last(2)
            loop
               Put(MA(i, j));
         end loop;
         New_Line;
      end loop;

   end PrintMatrix;

   function MultiplyMatrix(M1, M2 : in matrix; N : Natural) return matrix is
   begin
      declare
         RES : matrix(1 .. N, 1 .. N) := (others => (others => 0));
      begin
         for i in M1'First(1) .. M1'Last(1)
         loop
            for j in M1'First(1) .. M1'Last(1)
            loop
               for k in M1'First(1) .. M1'Last(1)
               loop
                  RES(i, j) := RES(i,j) + M1(i, k) * M2(k, i);
               end loop;
            end loop;
         end loop;
         PrintMatrix(RES);
         return (RES);
      end;
   end MultiplyMatrix;

   function AddMatrix(M1, M2 : in matrix; N : Natural) return matrix is
   begin
      declare
         RES : matrix(1 .. N, 1 .. N) := (others => (others => 0));
      begin
         for i in M1'First(1) .. M1'Last(1)
         loop
            for j in M1'First(1) .. M1'Last(1)
            loop
               for k in M1'First(1) .. M1'Last(1)
               loop
                  RES(i, j) := RES(i,j) + M1(i, k) + M2(k, i);
               end loop;
            end loop;
         end loop;
         PrintMatrix(RES);
         return (RES);
      end;
   end AddMatrix;

   procedure MulMatrixByNumber(M1 : in out matrix; N : Natural; NB : Integer) is
   begin
      declare
         RES : matrix(1 .. N, 1 .. N) := (others => (others => 0));
      begin
         for i in M1'First(1) .. M1'Last(1)
         loop
            for j in M1'First(1) .. M1'Last(1)
            loop
              M1(i, j) := M1(i, j) * NB;
            end loop;
         end loop;
         PrintMatrix(RES);
      end;
   end MulMatrixByNumber;

   MA : matrix := CreateMatrix(N);
   MB : matrix := CreateMatrix(N);
   MC : matrix := CreateMatrix(N);

begin
   MC := MultiplyMatrix(MA, MB, N);
   null;
end Lab1;

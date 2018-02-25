with Ada.Containers.Vectors, Ada.Text_IO, Ada.Integer_Text_IO, Ada.Synchronous_Task_Control;
use Ada.Containers, Ada.Text_IO, Ada.Integer_Text_IO, Ada.Synchronous_Task_Control;

procedure Lab1 is

   -- N is the size of matrix
   -- matrix is a two dimensional array of integers
   -- list of function prototypes used in the program

   type matrix is array (Integer range <>, Integer range <>) of Integer;
   function GetSize return Natural;

   function GetSize return Natural is
     N : Integer;
   begin
      Put("Enter an number of elements in matrix: ");
      Get(N);
      return (N);
   end;

   N : Natural := GetSize;

   S : Integer;

   SemT1Input : Suspension_Object;
   SemT3Input : Suspension_Object;
   SemT4Input : Suspension_Object;

   function CreateMatrix(N : in out Natural) return matrix;
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

   procedure RunTasks is
      task T1;
      task T2;
      task T3;
      task T4;

      task body T1 is

      begin
         Put_Line("PROCESS T1 STARTED!");

         Put_Line("ENTER MATRIX MB");
         AssignMatrix(MA);
         Set_True(SemT1Input);
         Put_Line("PROCESS T1 FINISHED!");
      end T1;

      task body T2 is
      begin
         Suspend_Until_True(SemT4Input);
         Put_Line("PROCESS T2 STARTED");



         Put_Line("PROCESS T2 FINISHED!");
      end T2;

      task body T3 is
      begin

         Suspend_Until_True(SemT1Input);
         Put_Line("PROCESS T3 STARTED");
         Put_Line("ENTER MATRIX MK");
         AssignMatrix(MK);
         Put_Line("ENTER MATRIX MM");
         AssignMatrix(MM);
         Set_True(SemT3Input);
         Put_Line("PROCESS T3 FINISHED!");
      end T3;

      task body T4 is
      begin
         Suspend_Until_True(SemT3Input);
         Put_Line("PROCESS T4 STARTED");

         Put_Line("ENTER MATRIX MC");
         AssignMatrix(MC);
         Put("ENTER S VALUE");
         Get(S);
         Set_True(SemT4Input);
         Put_Line("PROCESS T4 FINISHED!");
      end T4;

   begin
      null;
   end RunTasks;

begin
   Put_Line("Lab1 PROCESS STARTED!");
   RunTasks;
   Put_Line("Lab1 PROCESS FINISHED!");
   null;
end Lab1;

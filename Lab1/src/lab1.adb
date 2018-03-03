-- Laboratory work #1
-- Created by the student of CS-322(A)
-- Dima Zui
-- 25.02.2018
-- MA = MB * (MC * MK) + MM * S

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
                --Put("Enter element ");
                --Put(i);
                --Put(" ");
                --Put(j);
                --Put(" ");
                --Get(MA(i, j));
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
               RES(i, j) := RES(i,j) + M1(i, k) * M2(k, i);
            end loop;
      end loop;
   end loop;
   end MultiplyMatrix;

   procedure AddMatrix(M1, M2, RES : in out matrix; S_POS, E_POS : Natural) is
   begin
      for i in 1 .. N
      loop
         for j in S_POS .. E_POS
         loop
            RES(i, j) := M1(i, j) + M2(i, j);
         end loop;
      end loop;
   end AddMatrix;

   procedure MulMatrixByNumber(M1 : in out matrix; S_POS, E_POS : Natural; NB : Integer) is
   begin
     for i in 1 .. N
      loop
         for j in S_POS .. E_POS
            loop
              M1(i, j) := M1(i, j) * NB;
            end loop;
     end loop;
   end MulMatrixByNumber;

   Inp1, Inp2, Inp3 : Suspension_Object;

   Sem12, Sem13, Sem14 : Suspension_Object;
   Sem21, Sem23, Sem24 : Suspension_Object;
   Sem31, Sem32, Sem34 : Suspension_Object;
   Sem41, Sem42, Sem43 : Suspension_Object;

   SemCopy : Suspension_Object;

   procedure RunTasks is

      task T1;
      task T2;
      task T3;
      task T4;

      MC_MUL_MK : matrix := CreateMatrix(N);
      MC_MUL_MK_MUL_MB : matrix := CreateMatrix(N);

      task body T1 is
         MC_COPY1 : matrix := CreateMatrix(N);
         MK_COPY1 : matrix := CreateMatrix(N);
         MB_COPY1 : matrix := CreateMatrix(N);
         S_COPY1 : Integer;

         procedure SetTrue is
         begin
            Set_True(Sem12);
            Set_True(Sem13);
            Set_True(Sem14);
         end SetTrue;
         procedure Suspend is
         begin
            Suspend_Until_True(Sem21);
            Suspend_Until_True(Sem31);
            Suspend_Until_True(Sem41);
         end;

      begin
         Put_Line("PROCESS T1 STARTED!");

         Put_Line("ENTER MATRIX MB");
         AssignMatrix(MB);

         Set_True(Inp1);

         SetTrue;
         Suspend;

         Suspend_Until_True(SemCopy);
         MK_COPY1 := MK;
         MC_COPY1 := MC;
         S_COPY1 := S;
         MB_COPY1 := MB;
         Set_True(SemCopy);

         MultiplyMatrix(MC_COPY1, MK_COPY1, MC_MUL_MK, 1, H);
         MulMatrixByNumber(MM, 1, H, S_COPY1);

         SetTrue;
         Suspend;

         Put_Line("MC * MK");
         PrintMatrix(MC_MUL_MK);
         Put_Line("MM * S");
         MulMatrixByNumber(MM, 1, H, S_COPY1);
         PrintMatrix(MM);


         MultiplyMatrix(MB_COPY1, MC_MUL_MK, MC_MUL_MK_MUL_MB, 1, H);
         SetTrue;
         Suspend;
         Put_Line("MB * (MC * MK)");
         PrintMatrix(MC_MUL_MK_MUL_MB);

         AddMatrix(MC_MUL_MK_MUL_MB, MM, MA, 1, H);
         SetTrue;
         Put_Line("PROCESS T1 FINISHED!");

      end T1;

      task body T2 is
         MC_COPY2 : matrix := CreateMatrix(N);
         MK_COPY2 : matrix := CreateMatrix(N);
         MB_COPY2 : matrix := CreateMatrix(N);
         S_COPY2 : Integer;

         procedure SetTrue is
         begin
            Set_True(Sem21);
            Set_True(Sem23);
            Set_True(Sem24);
         end SetTrue;

         procedure Suspend is
         begin
            Suspend_Until_True(Sem12);
            Suspend_Until_True(Sem32);
            Suspend_Until_True(Sem42);
         end Suspend;
      begin
         Suspend_Until_True(Inp1);
         Put_Line("PROCESS T2 STARTED");
         Set_True(Inp2);

         SetTrue;
         Suspend;

         Suspend_Until_True(SemCopy);
         MK_COPY2 := MK;
         MC_COPY2 := MC;
         S_COPY2 := S;
         MB_COPY2 := MB;
         Set_True(SemCopy);

         MultiplyMatrix(MC_COPY2, MK_COPY2, MC_MUL_MK, H + 1, 2 * H);
         MulMatrixByNumber(MM, H + 1, 2 * H, S_COPY2);
         SetTrue;

         Suspend;
         MultiplyMatrix(MB_COPY2, MC_MUL_MK, MC_MUL_MK_MUL_MB, H + 1,2 * H);
         SetTrue;

         AddMatrix(MC_MUL_MK_MUL_MB, MM, MA, H + 1, 2 * H);
         SetTrue;
         Put_Line("PROCESS T2 FINISHED!");
      end T2;

      task body T3 is
         MC_COPY3 : matrix := CreateMatrix(N);
         MK_COPY3 : matrix := CreateMatrix(N);
         MM_COPY3 : matrix := CreateMatrix(N);
         MB_COPY3 : matrix := CreateMatrix(N);
         S_COPY3 : Integer;

         procedure SetTrue is
         begin
            Set_True(Sem31);
            Set_True(Sem32);
            Set_True(Sem34);
         end SetTrue;

         procedure Suspend is
         begin
            Suspend_Until_True(Sem13);
            Suspend_Until_True(Sem23);
            Suspend_Until_True(Sem43);
         end;
      begin
         Suspend_Until_True(Inp2);

         Put_Line("PROCESS T3 STARTED");
         Put_Line("ENTER MATRIX MK");
         AssignMatrix(MK);
         Put_Line("ENTER MATRIX MM");
         AssignMatrix(MM);

         Set_True(Inp3);
         SetTrue;
         Suspend;

         Suspend_Until_True(SemCopy);
         MK_COPY3 := MK;
         MC_COPY3 := MC;
         MM_COPY3 := MM;
         S_COPY3 := S;
         MB_COPY3 := MB;
         Set_True(SemCopy);

         MultiplyMatrix(MC_COPY3, MK_COPY3, MC_MUL_MK, 2 * H + 1, 3 * H);
         MulMatrixByNumber(MM, 2 * H + 1, 3 * H, S_COPY3);
         SetTrue;

         Suspend;
         MultiplyMatrix(MB_COPY3, MC_MUL_MK, MC_MUL_MK_MUL_MB, 2 * H + 1, 3 * H);
         SetTrue;

         AddMatrix(MC_MUL_MK_MUL_MB, MM, MA, 2 * H + 1, 3 * H);
         SetTrue;
         Suspend;
         Put_Line("MA := MB * (MC * MK) + MM * S");
         PrintMatrix(MA);
         Put_Line("PROCESS T3 FINISHED!");
      end T3;

      task body T4 is
         MC_COPY4 : matrix := CreateMatrix(N);
         MK_COPY4 : matrix := CreateMatrix(N);
         MB_COPY4 : matrix := CreateMatrix(N);
         S_COPY4 : Integer;

         procedure SetTrue is
         begin
            Set_True(Sem41);
            Set_True(Sem42);
            Set_True(Sem43);
         end SetTrue;

         procedure Suspend is
         begin
            Suspend_Until_True(Sem14);
            Suspend_Until_True(Sem24);
            Suspend_Until_True(Sem34);
         end;
      begin

         Suspend_Until_True(Inp3);
         Put_Line("PROCESS T4 STARTED");
         Put_Line("ENTER MATRIX MC");
         AssignMatrix(MC);
         Put("ENTER S VALUE ");
         Get(S);

         SetTrue;
         Suspend;

         Suspend_Until_True(SemCopy);
         MK_COPY4 := MK;
         MC_COPY4 := MC;
         S_COPY4 := S;
         MB_COPY4 := MB;
         Set_True(SemCopy);

         MultiplyMatrix(MC_COPY4, MK_COPY4, MC_MUL_MK, 3 * H + 1, 4 * H);
         MulMatrixByNumber(MM, 3 * H + 1, 4 * H, S_COPY4);
         SetTrue;

         Suspend;
         MultiplyMatrix(MB_COPY4, MC_MUL_MK, MC_MUL_MK_MUL_MB, 3 * H + 1, 4 * H);
         SetTrue;

         AddMatrix(MC_MUL_MK_MUL_MB, MM, MA, 3 * H + 1, 4 * H);
         SetTrue;
         Put_Line("PROCESS T4 FINISHED!");
      end T4;

   begin
      null;
   end RunTasks;

begin
   Put_Line("Lab1 PROCESS STARTED!");
   Set_True(SemCopy);
   RunTasks;
   Put_Line("Lab1 PROCESS FINISHED!");
   null;
end Lab1;

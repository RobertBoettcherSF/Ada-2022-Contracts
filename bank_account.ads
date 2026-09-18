--  Ada 2022 topic: Pre/Post contracts, type invariant, dynamic predicate.
pragma Ada_2022;

package Bank_Account is

   --  Dynamic predicate: balance never stored negative at the subtype level
   --  for the public view helpers below.
   subtype Credit is Integer
     with Dynamic_Predicate => Credit >= 0;

   type Account is private
     with Type_Invariant => Balance_Of (Account) >= 0;

   function Open (Initial : Credit := 0) return Account;

   function Balance_Of (A : Account) return Integer;

   procedure Deposit (A : in out Account; Amount : Credit)
     with
       Pre  => Amount > 0,
       Post => Balance_Of (A) = Balance_Of (A)'Old + Amount;

   procedure Withdraw (A : in out Account; Amount : Credit)
     with
       Pre  => Amount > 0 and then Amount <= Balance_Of (A),
       Post => Balance_Of (A) = Balance_Of (A)'Old - Amount;

   function Can_Withdraw (A : Account; Amount : Credit) return Boolean
     with Post => Can_Withdraw'Result = (Amount > 0 and then Amount <= Balance_Of (A));

private

   type Account is record
      Balance : Integer := 0;
   end record;

   function Balance_Of (A : Account) return Integer is (A.Balance);

end Bank_Account;

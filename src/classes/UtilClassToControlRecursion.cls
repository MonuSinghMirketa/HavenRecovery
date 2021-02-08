/**
* ─────────────────────────────────────────────────────────────────────────────────────────────────┐
* summary of this class.
*
* This class is to handle trigger recursion
* ──────────────────────────────────────────────────────────────────────────────────────────────────
* @author         Anusha Prasad
* @created        2020-12-12
* 
**/
public class UtilClassToControlRecursion {
    
    
    private static boolean isAfterUpdateTriggerCalled = false;

    
    public static boolean HasAfterUpdateTriggerCalled()
    {
        return isAfterUpdateTriggerCalled;
    }
    
    public static void SetAfterUpdateTriggerCalled()
    {
        isAfterUpdateTriggerCalled=true;
    }

}
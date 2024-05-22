@IsTest
private class TaskUtilTests {
    @IsTest
    static void testGetTaskPriorityNormal() {
        Test.startTest();
        String taskPriority = TaskUtil.getTaskPriority('WI');
        Assert.areEqual(taskPriority, 'Normal');
        Test.stopTest();
    }
    
    @IsTest
    static void testGetTaskPriorityHigh() {
        Test.startTest();
        String taskPriority = TaskUtil.getTaskPriority('CA');
        Assert.areEqual(taskPriority, 'High');
    	Test.stopTest();
    }
}
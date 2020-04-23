trigger ClosedOpportunityTrigger on Opportunity (after insert, after update) {
	String taskSubject;
	List<Task> taskList;
	Task currTask;

	taskSubject = 'Follow Up Test Task';
	taskList = new List<Task>();
	for (Opportunity opp : Trigger.new) {
		if (opp.StageName == 'Closed Won') {
			currTask = new Task(Subject = taskSubject, WhatId = opp.Id);
			taskList.add(currTask);
		}
	}
	if (taskList.size() > 0)
		insert taskList;
	return;
}
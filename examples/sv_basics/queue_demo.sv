module test;
	int q1[$],q2[$];
	int count;
	
	initial	begin
		for(int i=0;i<10;i++)	begin
			//q1.push_back(i);
			q1.push_back(i+3);
		end
		$display("QUEUE 	Q1=%p",q1);
		$display();
		
		// FIND
		q2 = q1.find with (item inside {[2:6]});
		$display("FIND Q2=%p",q2);
		q2.delete();
		
		// FIND_FIRST
		q2 = q1.find_first with (item > 5);
		$display("FIND_FIRST Q2=%p",q2);
		q2.delete();

		// FIND_FIRST_INDEX
		q2 = q1.find_first_index with (item > 7);
		$display("FIND_FIRST_INDEX Q2=%p",q2);
		q2.delete();
		
		// FIND_LAST
		q2 = q1.find_last with (item inside {[2:6]});
		$display("FIND_LAST Q2=%p",q2);
		q2.delete();
		
		// FIND_LAST_INDEX
		q2 = q1.find_last_index with (item > 2);
		$display("FIND_LAST_INDEX Q2=%p",q2);
		q2.delete();
		
		// FIND_INDEX
		q2 = q1.find_index with (item inside {[2:6]});
		$display("FIND_INDEX Q2=%p",q2);
		q2.delete();
		
		// SUM
		count = q1.sum with (int'(item > 6));
		$display("SUM COUNT=%d",count);
	end
endmodule
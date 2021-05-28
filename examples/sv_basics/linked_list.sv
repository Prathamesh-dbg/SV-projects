class Node;
	
	int data;
	string name;
	Node next;
	
	function new(string name = "");
		this.name = name;
	endfunction
	
	function set_node(int data, Node next);
		this.data = data;
		this.next = next;
	endfunction
	
	function print_node();
		$display("%s.data = %0d",name,data);
	endfunction
	
	function automatic parse_nodes();
		this.print_node();
		if(this.next != null)
			this.next.parse_nodes();
	endfunction
	
endclass

module test;
	Node A[];
	
	initial
	begin
		A = new[`NUM_OF_NODES];
		
		foreach(A[i])
			A[i]=new($sformatf("A[%0d]",i));
			
		for(int i=0;i<`NUM_OF_NODES;i++)
		begin
			A[i].set_node($urandom_range(0,`NUM_OF_NODES),((i==`NUM_OF_NODES-1)? null: A[i+1]));
		end
		$display("\n");
		A[0].parse_nodes();
	end
endmodule
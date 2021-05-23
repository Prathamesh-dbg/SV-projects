module test;


    //Callback driver/Facade class implementing empty virtual method. 
    //These methods are extended by specific drivers to implement
    //scenarios on available hooks.
    class Driver_cbs;

        virtual task pre_run(); endtask
        virtual task post_run(); endtask

    endclass //Driver_cbs


    //Protocol driver
    class Driver;

        Driver_cbs drv_cb_h = new();

        //Pre-planned hooks in Driver class
        //By default does nothing.
        task pre_run();
			$display("\n DRIVER:: PRE_RUN");
            drv_cb_h.pre_run();
        endtask

        task post_run();
			$display("\n DRIVER:: POST_RUN");
            drv_cb_h.post_run();
        endtask

        task run();

            //Hook1
            pre_run();

            //Protocol specific logic
            $display("\n DRIVER:: RUN");

            //Hook2
            post_run();

        endtask //run

    endclass //Driver

    class test extends Driver_cbs;

        task pre_run();
            $display("\n TEST:: PRE_RUN");
        endtask
		
		task post_run();
            $display("\n TEST:: POST_RUN");
        endtask

    endclass //test

    Driver drv_h;
    test t_h;

    initial
    begin

        drv_h = new();

        //
        //To achieve callback
        //
        t_h = new();
        drv_h.drv_cb_h = t_h;

        drv_h.run();

        #100;
        $display("End of simulation..\n");
        $finish;
    end

endmodule //testbench

//////////////////////////////////////////////////////////////////////////
//College: Tecnologico de Costa Rica									//
//																		//
//Authors:																//
//		Bryan Gomez														//
//		Oscar Segura                                                    //
//		Edgard Solera													//
// 																		//
//Curse: Functional Verification										//
//																		//
//Module Description:  Environment class for DRAM verification  		//
//																		//
//Details: Joint the driver, scoreboard and monitor classes				//
//																		//
//Date: October 2018													//
//////////////////////////////////////////////////////////////////////////

//************************************************************************
// The "ifndef" function is needed in compilation to avoid two  
// times definition for the same module.
// These "include"  is needed to define a previous module compilation.
//************************************************************************

`include "scoreboard.sv"
`include "driver.sv"
`include "monitor.sv"

//`ifndef environment_comp
//`include "driver.sv"
//`include "monitor.sv"
//`include "interface.sv"
//`define driver_comp 1
//`define monitor_comp 1
//`define environment_comp 1
//`endif

class environment;

	driver tb_driver;
	monitor tb_monitor;
	scoreboard tb_scoreboard;

	virtual bus_interface environment_interface;

	function new(virtual bus_interface environment_interface);
	begin
		this.tb_scoreboard=new();
		this.environment_interface = environment_interface;
		this.tb_driver=new(this.environment_interface,this.tb_scoreboard);
		this.tb_monitor=new(this.environment_interface,this.tb_scoreboard);
	end
	endfunction

endclass

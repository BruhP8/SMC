#include <systemc>
#include <limits>

#include "vci_gcd_master.h"
#include "vci_gcd_coprocessor.h"
#include "vci_vgsb.h"
#include "vci_signals.h"
#include "vci_param.h"
#include "mapping_table.h"

#define GCD_BASE	0x00000000
#define GCD_SIZE	16
	
int sc_main(int argc, char *argv[])
{
    using namespace sc_core;
	using namespace soclib::caba;
	using namespace soclib::common;

	// VCI fields width definition
	//	cell_size	= 4;
	// 	plen_size	= 8;
	// 	addr_size	= 32;
	// 	rerror_size	= 1;
	// 	clen_size	= 1;
	// 	rflag_size	= 1;
	// 	srcid_size	= 12;
	// 	trdid_size	= 1;
	// 	pktid_size	= 1;
	// 	wrplen_size	= 1;

	typedef VciParams< 4, 8, 32, 1, 1, 1, 12, 1, 1, 1> vci_param;

	///////////////////////////////////////////////////////////////////////////
	// simulation arguments : number of cycles & seed for the random generation
	///////////////////////////////////////////////////////////////////////////
        int ncycles = std::numeric_limits<int>::max();
        int seed    = 123456789;
        if (argc > 1) ncycles = atoi(argv[1]) ;
        if (argc > 2) seed = atoi(argv[2]) ;

	//////////////////////////////////////////////////////////////////////////
	// Mapping Table
	//////////////////////////////////////////////////////////////////////////
	MappingTable maptab(32, IntTab(8), IntTab(8), 0x03000000);
	maptab.add(soclib::common::Segment("GCD0", GCD_BASE             , GCD_SIZE, IntTab(0), true));
    maptab.add(soclib::common::Segment("GCD1", GCD_BASE + 0x10000000, GCD_SIZE, IntTab(1), true));
    maptab.add(soclib::common::Segment("GCD2", GCD_BASE + 0x20000000, GCD_SIZE, IntTab(2), true));
	std::cout << std::endl << maptab << std::endl;

	//////////////////////////////////////////////////////////////////////////
        // Signals
	//////////////////////////////////////////////////////////////////////////
        sc_clock               		signal_clk("signal_clk", sc_time( 1, SC_NS ), 0.5 );
        sc_signal<bool> 			signal_resetn("signal_resetn");

        VciSignals<vci_param> 		signal_vci_master0("signal_vci_master0");
        VciSignals<vci_param> 		signal_vci_master1("signal_vci_master1");
        VciSignals<vci_param> 		signal_vci_master2("signal_vci_master2");
        VciSignals<vci_param> 		signal_vci_coproc0("signal_vci_coproc0");
        VciSignals<vci_param> 		signal_vci_coproc1("signal_vci_coproc1");
        VciSignals<vci_param> 		signal_vci_coproc2("signal_vci_coproc2");

	//////////////////////////////////////////////////////////////////////////
	// Components
	//////////////////////////////////////////////////////////////////////////
    VciGcdMaster<vci_param> 	    master0("master0", IntTab(0), maptab, seed, GCD_BASE             );
    VciGcdMaster<vci_param> 	    master1("master1", IntTab(1), maptab, seed, GCD_BASE + 0x10000000);
    VciGcdMaster<vci_param> 	    master2("master2", IntTab(2), maptab, seed, GCD_BASE + 0x20000000);

	VciGcdCoprocessor<vci_param>	coproc0("coproc0", IntTab(0), maptab);
	VciGcdCoprocessor<vci_param>	coproc1("coproc1", IntTab(1), maptab);
	VciGcdCoprocessor<vci_param>	coproc2("coproc2", IntTab(2), maptab);

    VciVgsb<vci_param>               bus("bus", maptab, 3, 3);
	//////////////////////////////////////////////////////////////////////////
	// Net-List
	//////////////////////////////////////////////////////////////////////////
        // clk and rst
	master0.p_clk(signal_clk);
	master0.p_resetn(signal_resetn);
    master1.p_clk(signal_clk);
	master1.p_resetn(signal_resetn);
    master2.p_clk(signal_clk);
	master2.p_resetn(signal_resetn);    
	
    coproc0.p_clk(signal_clk);
	coproc0.p_resetn(signal_resetn);
    coproc1.p_clk(signal_clk);
	coproc1.p_resetn(signal_resetn);
    coproc2.p_clk(signal_clk);
	coproc2.p_resetn(signal_resetn);	

    bus.p_clk(signal_clk);
    bus.p_resetn(signal_resetn);

        // master and corproc 0
    master0.p_vci(signal_vci_master0);
    coproc0.p_vci(signal_vci_coproc0);
    bus.p_to_initiator[0](signal_vci_master0);
    bus.p_to_target[0](signal_vci_coproc0);

        // master and coproc 1
    master1.p_vci(signal_vci_master1);
    coproc1.p_vci(signal_vci_coproc1);
    bus.p_to_initiator[1](signal_vci_master1);
    bus.p_to_target[1](signal_vci_coproc1);

        // master and coproc 2
    master2.p_vci(signal_vci_master2);
    coproc2.p_vci(signal_vci_coproc2);
    bus.p_to_initiator[2](signal_vci_master2);
    bus.p_to_target[2](signal_vci_coproc2);
	//////////////////////////////////////////////////////////////////////////
	// simulation
	//////////////////////////////////////////////////////////////////////////
		sc_start(0);
        signal_resetn = false;

        sc_start( sc_time( 1, SC_NS ) ) ;
		

        signal_resetn = true;
        for ( size_t n=1 ; n<ncycles ; n++) sc_start( sc_time( 1, SC_NS ) ) ;

        return(0);

} // end sc_main


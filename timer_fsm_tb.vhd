--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   20:13:26 03/02/2016
-- Design Name:   
-- Module Name:   D:/Sa diska F na staroj masini/Projekcije i Programi/ISE/RA77-2013/RA77-2013/LPRS2/20160302/Pocetni/timer_fsm_tb.vhd
-- Project Name:  Pocetni
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: timer_fsm
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY timer_fsm_tb IS
END timer_fsm_tb;
 
ARCHITECTURE behavior OF timer_fsm_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT timer_fsm
    PORT(
         clk_i : IN  std_logic;
         rst_i : IN  std_logic;
         reset_switch_i : IN  std_logic;
         start_switch_i : IN  std_logic;
         stop_switch_i : IN  std_logic;
         continue_switch_i : IN  std_logic;
         cnt_en_o : OUT  std_logic;
         cnt_rst_o : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal clk_i : std_logic := '0';
   signal rst_i : std_logic := '0';
   signal reset_switch_i : std_logic := '0';
   signal start_switch_i : std_logic := '0';
   signal stop_switch_i : std_logic := '0';
   signal continue_switch_i : std_logic := '0';

 	--Outputs
   signal cnt_en_o : std_logic;
   signal cnt_rst_o : std_logic;

   -- Clock period definitions
   constant clk_i_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: timer_fsm PORT MAP (
          clk_i => clk_i,
          rst_i => rst_i,
          reset_switch_i => reset_switch_i,
          start_switch_i => start_switch_i,
          stop_switch_i => stop_switch_i,
          continue_switch_i => continue_switch_i,
          cnt_en_o => cnt_en_o,
          cnt_rst_o => cnt_rst_o
        );

   -- Clock process definitions
   clk_i_process :process
   begin
		clk_i <= '0';
		wait for clk_i_period/2;
		clk_i <= '1';
		wait for clk_i_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
		rst_i <= '1';
		reset_switch_i <= '1';
		start_switch_i <= '0';
		stop_switch_i <= '0';
		continue_switch_i <= '0';
      wait for 100 ns;
		rst_i <= '0';
		reset_switch_i <= '0';
		wait for 100 ns;
		start_switch_i <= '1';
		wait for 40 ns;
		start_switch_i <= '0';
			

      wait for clk_i_period*10;

      -- insert stimulus here 

      wait;
   end process;

END;

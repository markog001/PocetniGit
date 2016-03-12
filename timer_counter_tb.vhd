--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   19:10:32 03/02/2016
-- Design Name:   
-- Module Name:   D:/Sa diska F na staroj masini/Projekcije i Programi/ISE/RA77-2013/RA77-2013/LPRS2/20160302/Pocetni/timer_counter_tb.vhd
-- Project Name:  Pocetni
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: timer_counter
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
 
ENTITY timer_counter_tb IS
END timer_counter_tb;
 
ARCHITECTURE behavior OF timer_counter_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT timer_counter
    PORT(
         clk_i     : IN STD_LOGIC; -- ulazni takt
		 rst_i     : IN STD_LOGIC; -- reset signal 
		 one_sec_i : IN STD_LOGIC; -- signal koji predstavlja proteklu jednu sekundu vremena 
		 cnt_en_i  : IN STD_LOGIC; -- signal dozvole brojanja                              
		 cnt_rst_i : IN STD_LOGIC; -- signal resetovanja brojaca (clear signal)
		 bt_min_i  : IN STD_LOGIC;
		 bt_hour_i : IN STD_LOGIC;
		 led_o     : OUT STD_LOGIC_VECTOR(7 DOWNTO 0) -- izlaz ka led diodama
        );
    END COMPONENT;
    

   --Inputs
   signal clk_i : std_logic := '0';
   signal rst_i : std_logic := '0';
   signal one_sec_i : std_logic := '0';
   signal cnt_en_i : std_logic := '0';
   signal cnt_rst_i : std_logic := '0';
	signal bt_min_i : std_logic := '0';
	signal bt_hour_i : std_logic := '1';

 	--Outputs
   signal led_o : std_logic_vector(7 downto 0);

   -- Clock period definitions
   constant clk_i_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: timer_counter PORT MAP (
          clk_i => clk_i,
          rst_i => rst_i,
          one_sec_i => one_sec_i,
          cnt_en_i => cnt_en_i,
          cnt_rst_i => cnt_rst_i,
			 bt_min_i => bt_min_i,
			 bt_hour_i => bt_hour_i,
          led_o => led_o
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
		cnt_rst_i <= '1';
		one_sec_i <= '0';
		cnt_en_i <= '1';
		
      wait for 100 ns;
		rst_i <= '0';
		cnt_rst_i <= '0';
		
		wait for 100 ns;
		one_sec_i <= '1';
		wait for 10 ns;
		one_sec_i <= '0';
		
		wait for 100 ns;
		one_sec_i <= '1';
		wait for 10 ns;
		one_sec_i <= '0';
		
		wait for 100 ns;
		one_sec_i <= '1';
		wait for 10 ns;
		one_sec_i <= '0';
		
		wait for 100 ns;
		one_sec_i <= '1';
		wait for 10 ns;
		one_sec_i <= '0';
		
		wait for 100 ns;
		one_sec_i <= '1';
		wait for 10 ns;
		one_sec_i <= '0';
		
		wait for 100 ns;
		one_sec_i <= '1';
		wait for 10 ns;
		one_sec_i <= '0';
		
		wait for 100 ns;
		one_sec_i <= '1';
		wait for 10 ns;
		one_sec_i <= '0';
		
		wait for 100 ns;
		one_sec_i <= '1';
		wait for 10 ns;
		one_sec_i <= '0';
		
		wait for 100 ns;
		one_sec_i <= '1';
		wait for 10 ns;
		one_sec_i <= '0';
		
		wait for 100 ns;
		one_sec_i <= '1';
		wait for 10 ns;
		one_sec_i <= '0';
		
		wait for 100 ns;
		one_sec_i <= '1';
		wait for 10 ns;
		one_sec_i <= '0';
		
		wait for 100 ns;
		one_sec_i <= '1';
		wait for 10 ns;
		one_sec_i <= '0';
		
		wait for 100 ns;
		one_sec_i <= '1';
		wait for 10 ns;
		one_sec_i <= '0';
		
		wait for 100 ns;
		one_sec_i <= '1';
		wait for 10 ns;
		one_sec_i <= '0';
		
		wait for 100 ns;
		one_sec_i <= '1';
		wait for 10 ns;
		one_sec_i <= '0';
		
		wait for 100 ns;
		one_sec_i <= '1';
		wait for 10 ns;
		one_sec_i <= '0';
		
		wait for 100 ns;
		one_sec_i <= '1';
		wait for 10 ns;
		one_sec_i <= '0';
		
		wait for 100 ns;
		one_sec_i <= '1';
		wait for 10 ns;
		one_sec_i <= '0';
		
		wait for 100 ns;
		one_sec_i <= '1';
		wait for 10 ns;
		one_sec_i <= '0';
		
		wait for 100 ns;
		one_sec_i <= '1';
		wait for 10 ns;
		one_sec_i <= '0';
		
		wait for 100 ns;
		one_sec_i <= '1';
		wait for 10 ns;
		one_sec_i <= '0';
		
		wait for 100 ns;
		one_sec_i <= '1';
		wait for 10 ns;
		one_sec_i <= '0';
		
		wait for 100 ns;
		one_sec_i <= '1';
		wait for 10 ns;
		one_sec_i <= '0';
		
		wait for 100 ns;
		one_sec_i <= '1';
		wait for 10 ns;
		one_sec_i <= '0';
		
		wait for 100 ns;
		one_sec_i <= '1';
		wait for 10 ns;
		one_sec_i <= '0';
		
		wait for 100 ns;
		one_sec_i <= '1';
		wait for 10 ns;
		one_sec_i <= '0';
		
		wait for 100 ns;
		one_sec_i <= '1';
		wait for 10 ns;
		one_sec_i <= '0';
		
		wait for 100 ns;
		one_sec_i <= '1';
		wait for 10 ns;
		one_sec_i <= '0';
		
		wait for 100 ns;
		one_sec_i <= '1';
		wait for 10 ns;
		one_sec_i <= '0';
		
		
		

      -- insert stimulus here 

      wait;
   end process;

END;

--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   17:45:29 03/05/2016
-- Design Name:   
-- Module Name:   D:/Sa diska F na staroj masini/Projekcije i Programi/ISE/RA77-2013/lprs20160303/Pocetni/debouncer_tb.vhd
-- Project Name:  Pocetni
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: debouncer
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
 
ENTITY debouncer_tb IS
END debouncer_tb;
 
ARCHITECTURE behavior OF debouncer_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT debouncer
    PORT(
         iButton : IN  std_logic;
         iClk : IN  std_logic;
         inRst : IN  std_logic;
         oButton : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal iButton : std_logic := '0';
   signal iClk : std_logic := '0';
   signal inRst : std_logic := '0';

 	--Outputs
   signal oButton : std_logic;

   -- Clock period definitions
   constant iClk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: debouncer PORT MAP (
          iButton => iButton,
          iClk => iClk,
          inRst => inRst,
          oButton => oButton
        );

   -- Clock process definitions
   iClk_process :process
   begin
		iClk <= '0';
		wait for iClk_period/2;
		iClk <= '1';
		wait for iClk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
		inRst <= '0';
		iButton <= '0';
      wait for 100 ns;	
		inRst <= '1';
		wait for 100 ns;
		iButton <= '1';
		wait for 200 ns;
		iButton <= '0';
		wait for 200 ns;
		iButton <= '1';
		wait for 40 ns;
		iButton <= '0';
		wait for 200 ns;

      -- insert stimulus here 

      wait;
   end process;

END;

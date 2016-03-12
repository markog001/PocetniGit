----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:20:38 03/05/2016 
-- Design Name: 
-- Module Name:    debouncer - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity debouncer is
    Port ( iButton 	: in  STD_LOGIC;
           iClk 		: in  STD_LOGIC;
           inRst 		: in  STD_LOGIC;
           oButton 	: out  STD_LOGIC);
end debouncer;

architecture Behavioral of debouncer is

component reg
	generic(
		WIDTH    : positive := 1;
		RST_INIT : integer := 0
	);
	port(
		i_clk  : in  std_logic;
		in_rst : in  std_logic;
		i_d    : in  std_logic_vector(WIDTH-1 downto 0);
		o_q    : out std_logic_vector(WIDTH-1 downto 0)
	);
end component;

signal sNextRegState : std_logic_vector(6 downto 0);
signal sRegState 		: std_logic_vector(6 downto 0);
signal sCntRound		: std_logic;
signal sButtonIn		: std_logic_vector(0 downto 0);
signal sButtonOut		: std_logic_vector(0 downto 0);

begin
	sNextRegState	<=	sRegState + 1	when	sRegState < 99
	else	(others => '0');

	cntReg : reg
	generic map(
		WIDTH 	=> 7,
		RST_INIT => 0
	)
	port map(
		i_clk 	=> iClk,
		in_rst 	=> inRst,
		i_d 		=> sNextRegState,
		o_q 		=> sRegState
	);
	
	sCntRound <= '0' when sRegState > 0
	else '1';
	
	--stores button state for one count circle
	btnReg : reg
	generic map(
		WIDTH => 1,
		RST_INIT => 0
	)
	port map(
		i_clk 	=> sCntRound,
		in_rst 	=> inRst,
		i_d 		=> sButtonIn,
		o_q 		=> sButtonOut
	);
	
	sButtonIn(0)	<= iButton;
	oButton			<= sButtonOut(0);


end Behavioral;


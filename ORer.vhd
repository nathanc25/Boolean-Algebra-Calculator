----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/28/2024 03:19:00 PM
-- Design Name: 
-- Module Name: ORer - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity ORer is
    PORT (input0or : IN STD_LOGIC_VECTOR (3 downto 0);
          input1or : IN STD_LOGIC_VECTOR (3 downto 0);
          outputor : out STD_LOGIC_VECTOR (3 downto 0));
end ORer;

architecture Behavioral of ORer is

begin

outputor <= input0or OR input1or;

end Behavioral;

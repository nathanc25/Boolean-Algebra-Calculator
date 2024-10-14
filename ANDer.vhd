----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/28/2024 03:16:10 PM
-- Design Name: 
-- Module Name: ANDer - Behavioral
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

entity ANDer is
    PORT (input0and : IN STD_LOGIC_VECTOR (3 downto 0);
    input1and : IN STD_LOGIC_VECTOR (3 downto 0);
    outputand : out STD_LOGIC_VECTOR (3 downto 0));
end ANDer;

architecture Behavioral of ANDer is

begin

outputand <= input0and AND input1and;

end Behavioral;

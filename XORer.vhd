----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/28/2024 03:21:44 PM
-- Design Name: 
-- Module Name: XORer - Behavioral
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

entity XORer is
    PORT (input0xor : IN STD_LOGIC_VECTOR (3 downto 0);
          input1xor : IN STD_LOGIC_VECTOR (3 downto 0);
          outputxor : out STD_LOGIC_VECTOR (3 downto 0));
end XORer;

architecture Behavioral of XORer is

begin

outputxor <= input0xor XOR input1xor;

end Behavioral;

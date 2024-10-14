----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/28/2024 03:18:28 PM
-- Design Name: 
-- Module Name: addder - Behavioral
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

entity addder is
    PORT (input0add : IN STD_LOGIC_VECTOR (3 downto 0);
    input1add : IN STD_LOGIC_VECTOR (3 downto 0);
    carryinadd : IN STD_LOGIC;
    outputsadd : out STD_LOGIC_VECTOR (4 downto 0));
end addder;



architecture Structural of addder is
-- component declaration

component bit_full_adder is
    port (
        A,B,Cin : in std_logic;
        S : out std_logic;
        Cout : out std_logic);
end component bit_full_adder;

-- signal declaration
signal carry0: std_logic;
signal carry1: std_logic;
signal carry2: std_logic;

begin
-- component instantiation
    AA: bit_full_adder
        port map (
            A => input0add(0),
            B => input1add(0),
            Cin => carryinadd,
            S => outputsadd(0),
            Cout => carry0);
    BB: bit_full_adder
        port map (
            A => input0add(1),
            B => input1add(1),
            Cin => carry0,
            S => outputsadd(1),
            Cout => carry1);
    CC: bit_full_adder
        port map (
            A => input0add(2),
            B => input1add(2),
            Cin => carry1,
            S => outputsadd(2),
            Cout => carry2);
    DD: bit_full_adder
        port map (
            A => input0add(3),
            B => input1add(3),
            Cin => carry2,
            S => outputsadd(3),
            Cout => outputsadd(4));


end Structural;

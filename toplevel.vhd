----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/14/2024 04:08:26 PM
-- Design Name: 
-- Module Name: toplevel - Behavioral
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

entity toplevel is
    PORT (inputs0 : IN STD_LOGIC_VECTOR (3 downto 0);
    inputs1 : IN STD_LOGIC_VECTOR (3 downto 0);
    controls : IN STD_LOGIC_VECTOR (1 downto 0);
    carryin : IN STD_LOGIC;
    clk : IN STD_LOGIC;
    seg_out : out STD_LOGIC_VECTOR (6 downto 0);
    anodes : out STD_LOGIC_VECTOR (3 downto 0));
end toplevel;
    
architecture Structural of toplevel is

-- Component declaration
component addder is
    port (input0add : IN STD_LOGIC_VECTOR (3 downto 0);
    input1add : IN STD_LOGIC_VECTOR (3 downto 0);
    carryinadd : IN STD_LOGIC;
    outputsadd : out STD_LOGIC_VECTOR (4 downto 0));
end component addder;

component ANDer is
    port (input0and, input1and : IN STD_LOGIC_VECTOR (3 downto 0);
    outputand : out STD_LOGIC_VECTOR (3 downto 0));
end component ANDer;

component ORer is
    port (input0or, input1or : IN STD_LOGIC_VECTOR (3 downto 0);
    outputor : out STD_LOGIC_VECTOR (3 downto 0));
end component ORer;

component XORer is
    port (input0xor, input1xor : IN STD_LOGIC_VECTOR (3 downto 0);
    outputxor : out STD_LOGIC_VECTOR (3 downto 0));
end component XORer;

component function_select is
    port (Input0, Input1, Input2 : IN STD_LOGIC_VECTOR (3 downto 0);
          Input3 : IN STD_LOGIC_VECTOR (4 downto 0);
          control : in  STD_LOGIC_VECTOR (1 downto 0);
          Output : out  STD_LOGIC_VECTOR (4 downto 0));
end component function_select;

component display_driver is
    port (
        inputs: in std_logic_vector (3 downto 0);
        seg_out : out std_logic_vector (6 downto 0));
end component display_driver;

component LEDdisplay is 
    port (
        clk	: IN  STD_LOGIC;
        seg0,seg1,seg2,seg3: IN  STD_LOGIC_VECTOR(6 downto 0);
        seg : OUT  STD_LOGIC_VECTOR(6  downto 0);
        an : OUT STD_LOGIC_VECTOR(3 downto 0));
end component LEDdisplay;

-- signal declaration
signal outadd: std_logic_vector (4 downto 0);
signal outand: std_logic_vector (3 downto 0);
signal outor: std_logic_vector (3 downto 0);
signal outxor: std_logic_vector (3 downto 0);
signal outfunction: std_logic_vector (4 downto 0);
signal sig1: std_logic_vector (6 downto 0);
signal sig2: std_logic_vector (6 downto 0);


begin
-- component instantiation
    adderr: addder
        port map (
            input0add => inputs0,
            input1add => inputs1,
            carryinadd => carryin,
            outputsadd => outadd);
    
    anderr: ANDer
        port map (
            input0and => inputs0,
            input1and => inputs1,
            outputand => outand);
            
    orerr: ORer
        port map (
            input0or => inputs0,
            input1or => inputs1,
            outputor => outor);
    
    xorerr: XORer
        port map (
            input0xor => inputs0,
            input1xor => inputs1,
            outputxor => outxor);
            
    functionselect: function_select
        port map (
            Input0 => outand,
            Input1 => outor,
            Input2 => outxor,
            Input3 => outadd,
            control => controls,
            Output => outfunction);
    
    display1: display_driver
        port map (
            inputs(0) => outfunction(0),
            inputs(1) => outfunction(1),
            inputs(2) => outfunction(2),
            inputs(3) => outfunction(3),
            seg_out => sig1);

    display2: display_driver
        port map (
            inputs(0) => outfunction(4),
            inputs(1) => '0',
            inputs(2) => '0',
            inputs(3) => '0',
            seg_out => sig2);
            
    LED: LEDdisplay
        port map (
            clk => clk,
            seg0 => sig1,
            seg1 => sig2,
            seg2 => "1111111",
            seg3 => "1111111",
            seg => seg_out,
            an => anodes);
            
            

end Structural;

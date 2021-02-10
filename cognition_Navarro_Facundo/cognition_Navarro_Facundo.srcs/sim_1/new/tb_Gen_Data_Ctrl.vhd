----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/09/2021 08:57:32 PM
-- Design Name: 
-- Module Name: tb_Gen_Data_Ctrl - tb_arch
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

entity tb_Gen_Data_Ctrl is
--  Port ( );
end tb_Gen_Data_Ctrl;

architecture tb_arch of tb_Gen_Data_Ctrl is
    constant T: time := 20 ns;
    constant N_tb : integer := 16;
    signal clk_tb, reset_tb : std_logic;  
    signal TDATA_tb : std_logic_vector(N_tb*2-1 downto 0);
    
begin

--******************************************************
-- instantiation
--******************************************************

gen_data_ctrl_unit : entity work.Gen_Data_Ctrl(arch)
generic map ( N => N_tb)
port map( 
                clk => clk_tb,
                reset =>  reset_tb,
                TDATA => TDATA_tb
            );

--******************************************************
-- clock
--******************************************************
    process
    begin
        clk_tb <= '0';
        wait for T/2;
        clk_tb <='1';
        wait for T/2;
    end process;

  --******************************************************
-- reset
--******************************************************  
reset_tb <= '1', '0' after (2*T)/3;

end tb_arch;

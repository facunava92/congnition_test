----------------------------------------------------------------------------------
-- Company: cognition
-- Engineer: Navarro, Facundo
-- 
-- Create Date: 02/09/2021 06:58:31 PM
-- Design Name: Gen_Data_Ctrl
-- Module Name: Gen_Data_Ctrl - arch
-- Project Name: cognition_Navarro_Facundo
-- Target Devices: Basys3
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
use IEEE.NUMERIC_STD.ALL;

entity Gen_Data_Ctrl is
    generic( N : integer := 16 );   -- this value is overwrite in generic map instantiation
    port (   clk, reset         :     in  std_logic;
                --s_TREADY       :     in std_logic
                TDATA              :    out std_logic_vector (2*N -1 downto 0)
            );
end Gen_Data_Ctrl;

architecture arch of Gen_Data_Ctrl is
signal cnt_up_reg          :   unsigned (N-1 downto 0) := (others =>'0');
signal cnt_down_reg     :   unsigned (N-1 downto 0) := (others =>'1');
signal cnt_up_next        :   unsigned (N-1 downto 0);
signal cnt_down_next   :   unsigned (N-1 downto 0);

begin

--******************************************************
-- syncronous reset
--******************************************************
    reset_gen : process(clk, reset)
    begin
    if(rising_edge(clk)) then
        if (reset = '1') then
            cnt_up_reg      <= (others => '0');
            cnt_down_reg <= (others => '1');
       else
            cnt_up_reg      <= cnt_up_next;
            cnt_down_reg <= cnt_down_next;
       end if;
    end if;

    end process;
    
    cnt_up_next         <= cnt_up_reg  + 1;
    cnt_down_next    <= cnt_down_reg - 1;

    TDATA <= std_logic_vector(cnt_up_reg & cnt_down_reg);
end arch;

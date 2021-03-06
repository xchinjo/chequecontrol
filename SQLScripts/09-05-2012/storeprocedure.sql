USE [LLSUDTA]
GO
/****** Object:  StoredProcedure [dbo].[SP_LS_DAILY_DAY_END]    Script Date: 05/09/2012 11:43:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

drop procedure SP_LS_DAILY_DAY_END

CREATE PROCEDURE [dbo].[SP_LS_DAILY_DAY_END]
AS
BEGIN
	-- Declare the return variable here
    DECLARE @FNC_STR VARCHAR(256); 

	-- Add the T-SQL statements to compute the return value here
    set @FNC_STR = N'EXEC [dbo].[SP_LS_DAYEND] '
    + ''''+ '01' +''','
    + ''''+ '2'  +''','
	+ ''''+ '01' +''','
	+ ''''+convert(varchar,getdate(),112)+''''
    +'';
    exec(@FNC_STR);	    

	--select convert(varchar,getdate(),112);
    RETURN
END

-- EXEC [dbo].[SP_LS_DAILY_DAY_END]
GO
/****** Object:  StoredProcedure [dbo].[sp_team_count]    Script Date: 05/09/2012 11:44:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
drop procedure sp_team_count

CREATE procedure [dbo].[sp_team_count]

As
Begin

 
		SELECT  A.INSCRN ,A.insild ,A.INSF11 ,A.insitm ,A.insiam ,A.INSVLD ,A.INSILD,
			 --  D.CENTER_CODE,
			   ( D.TH_FIRST_NAME + ' ' + D.TH_LAST_NAME) as  FullName ,
			   E.EMAIL 
	           	
			FROM  [LLSPDTA].dbo .HPTINS00 A 
			  left join [LLSPDTA].dbo .CQDM007 B on A.INSCRN = B.CQMCSN 
			  left join [LLSPDTA].dbo .HPMCON00 C on B.CQMCSN = C.CONRUN 
			  left join [HTLC_APP].dbo.HLTC_C_CENTER D on C.CONCUS= D.CENTER_CODE
			  left join [HTLC_APP].dbo.HLTC_C_ADDRESS E on D.CENTER_CODE =E.CENTER_CODE  	
			where A.INSITM <> '0' --and A.INSF11 = '3'
			--	and A.INSCRN ='8100415'	
				
			GROUP BY A.INSCRN,A.insild,A.INSF11,A.INSVLD,A.insiam,A.insitm, E.EMAIL,D.TH_TITLE_NAME ,D.TH_FIRST_NAME ,D.TH_LAST_NAME 
			order by A.INSCRN,A.insitm

-- exec sp_team_count

End
GO
/****** Object:  StoredProcedure [dbo].[Test]    Script Date: 05/09/2012 11:44:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Test] 

as
begin

declare @CCC int
declare @x int
DECLARE @str  VARCHAR (255)
DECLARE @name VARCHAR(50) -- database name  
DECLARE @path VARCHAR(256) -- path for backup files  
DECLARE @fileName VARCHAR(256) -- filename for backup  
DECLARE @fileDate VARCHAR(20) -- used for file name 

DECLARE @ID INT
DECLARE db_cursor CURSOR FOR 

  SELECT id From test_ton
  OPEN db_cursor 
    FETCH NEXT FROM db_cursor INTO @id

    WHILE @@FETCH_STATUS = 0 
      BEGIN 
      -- do something
        PRINT @ID 
      FETCH NEXT FROM db_cursor INTO @id
      END 
  CLOSE db_cursor 
DEALLOCATE db_cursor





End
GO
/****** Object:  UserDefinedFunction [dbo].[FN_LS_GET_DTE_VAL]    Script Date: 05/09/2012 11:44:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date, ,>
-- Description:	<Description, ,>
-- =============================================
drop function FN_LS_GET_DTE_VAL

CREATE FUNCTION [dbo].[FN_LS_GET_DTE_VAL](
--ALTER FUNCTION [dbo].[FN_LS_GET_DTE_VAL](
@OPT	INT,
@DTE	DATETIME,
@DTE01	DATETIME,
@DTE02	DATETIME,
@DTE03	DATETIME,
@DTE04	DATETIME,
@DTE05	DATETIME,
@DTE06	DATETIME,
@DTE07	DATETIME,
@DTE08	DATETIME,
@DTE09	DATETIME,
@DTE10	DATETIME
)
RETURNS DATETIME
AS
BEGIN
	-- Declare the return variable here
	DECLARE @ResultDte DATETIME;

    --DECLARE @FNC_STR VARCHAR(256); 
	SELECT @ResultDte = 
	case @OPT
		when 00 then	NULL
		when 11 then	@DTE01
		when 12 then	@DTE02
		when 13 then	@DTE03
		when 14 then	@DTE04
		when 15 then	@DTE05
		when 16 then	@DTE06
		when 17 then	@DTE07
		when 18 then	@DTE08
		when 19 then	@DTE09
		when 20 then	@DTE10 
		else			@DTE
	END

    RETURN coalesce(@ResultDte, NULL);
END
GO
/****** Object:  UserDefinedFunction [dbo].[FN_LS_GET_NUM_VAL]    Script Date: 05/09/2012 11:44:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date, ,>
-- Description:	<Description, ,>
-- =============================================
--CREATE FUNCTION [dbo].[FN_LS_GET_NUM_VAL](
drop function FN_LS_GET_NUM_VAL


CREATE FUNCTION [dbo].[FN_LS_GET_NUM_VAL](
@OPT	INT,
@NUM	NUMERIC(13, 2),
@NUM01	NUMERIC(13, 2),
@NUM02	NUMERIC(13, 2),
@NUM03	NUMERIC(13, 2),
@NUM04	NUMERIC(13, 2),
@NUM05	NUMERIC(13, 2),
@NUM06	NUMERIC(13, 2),
@NUM07	NUMERIC(13, 2),
@NUM08	NUMERIC(13, 2),
@NUM09	NUMERIC(13, 2),
@NUM10	NUMERIC(13, 2)
)
RETURNS numeric(13, 2)
AS
BEGIN
	-- Declare the return variable here
	DECLARE @ResultAmt numeric(11, 2);

    --DECLARE @FNC_STR VARCHAR(256); 
	SELECT @ResultAmt = 
	case @OPT
		when 00 then	0.00
		when 11 then	@NUM01
		when 12 then	@NUM02
		when 13 then	@NUM03
		when 14 then	@NUM04
		when 15 then	@NUM05
		when 16 then	@NUM06
		when 17 then	@NUM07
		when 18 then	@NUM08
		when 19 then	@NUM09
		when 20 then	@NUM10 
		else			@NUM
	END

    RETURN coalesce(@ResultAmt, 0.00);
END
GO
/****** Object:  UserDefinedFunction [dbo].[FN_LS_GET_INSTALLMENT]    Script Date: 05/09/2012 11:44:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date, ,>
-- Description:	<Description, ,>
-- =============================================
drop function FN_LS_GET_INSTALLMENT

CREATE FUNCTION [dbo].[FN_LS_GET_INSTALLMENT](
@PRM_BRN VARCHAR(2),
@PRM_PDM VARCHAR(1),
@PRM_PDT VARCHAR(2),
@PRM_RUN VARCHAR(7),
@PRM_DTE DATETIME
)
RETURNS numeric(11, 2)
AS
BEGIN
	-- Declare the return variable here
	DECLARE @ResultAmt numeric(11, 2);

	-- Add the T-SQL statements to compute the return value here
	--SELECT <@ResultVar, sysname, @Result> = <@Param1, sysname, @p1>	
    select @ResultAmt = Sum( (INSIAM-INSIRA) + (INSVAM-INSVRA) ) 
	from [dbo].[hptins07]
	where INSCBR  = @Prm_BRN
	and INSCPM  = @Prm_PDM
	and INSCPT  = @Prm_PDT
	and INSCRN  = @Prm_RUN
	and INSDUE <= @Prm_DTE;

	-- Return the result of the function
    RETURN coalesce(@ResultAmt, 0.00);
END
GO
/****** Object:  UserDefinedFunction [dbo].[FN_LS_GET_PENALTY]    Script Date: 05/09/2012 11:44:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date, ,>
-- Description:	<Description, ,>
-- =============================================
drop function FN_LS_GET_PENALTY

CREATE FUNCTION [dbo].[FN_LS_GET_PENALTY](
	@PRM_BRN_I varchar(2),
	@PRM_PDM_I varchar(1),
	@PRM_PDT_I varchar(2),
	@PRM_RUN_I varchar(7),
	@PRM_EFD_I datetime,
	@PRM_MOD_I varchar(1)
)
RETURNS numeric(13,2)
AS
BEGIN
	-- Declare the return variable here
	DECLARE @ResultPenalty		numeric(13,2);

	-- Add the T-SQL statements to compute the return value here
    SELECT	@ResultPenalty = coalesce(sum(MLGAMT), 0.00) 
      FROM	[dbo].[FN_LS_PENALTY_10]
			(@PRM_BRN_I, @PRM_PDM_I, @PRM_PDT_I, @PRM_RUN_I, @PRM_EFD_I,'5');

	-- Return the result of the function
	RETURN	@ResultPenalty;

END
GO
/****** Object:  UserDefinedFunction [dbo].[FN_GET_DPD_FLOODING]    Script Date: 05/09/2012 11:44:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

drop function FN_GET_DPD_FLOODING

CREATE FUNCTION [dbo].[FN_GET_DPD_FLOODING]
(				@PRM_BRN			VARCHAR(2),		-- BRANCH
				@PRM_PDM			VARCHAR(1),		-- PROGRAM SYSTEM
				@PRM_PDT			VARCHAR(2),		-- PROGRAM TYPE
				@PRM_RUN			VARCHAR(7),		-- CONTRACT NO
				@PRM_DTE			DATETIME,		-- AS OF DATE
                @PRM_RST			INT				-- TYPE RESULT ('1' : DPD, '2' : DLQ)
)	
RETURNS			INT
AS
BEGIN
    DECLARE		@RESULT			INT;

    SELECT @RESULT = (CASE WHEN @PRM_RST = 1 THEN 
                                CASE WHEN (TB_RESULT.DPD - TB_RESULT.FLOODING_DAY) <= 0 THEN 0
                                     ELSE (TB_RESULT.DPD - TB_RESULT.FLOODING_DAY) END
                           WHEN @PRM_RST = 2 THEN
                                CASE WHEN (TB_RESULT.DPD - TB_RESULT.FLOODING_DAY) <= 0 THEN 0
                                     ELSE CONVERT(INT,CONVERT(VARCHAR,DATEADD(DAY,1,TB_RESULT.FLOODING_INSDUE),112)) END
                           ELSE 0 END)
    FROM (
    SELECT TB_FLOODING.INSCRN
         , MIN(TB_FLOODING.INSDUE) AS INSDUE 
         , MIN(TB_FLOODING.FLOODING_INSDUE) AS FLOODING_INSDUE 
         , MAX(TB_FLOODING.DPD) AS DPD
         , DATEDIFF(DAY
                   ,CASE WHEN (MIN(TB_FLOODING.INSDUE) <= MIN(TB_FLOODING.FLOODING_INSFRD)) THEN
                               MIN(TB_FLOODING.FLOODING_INSFRD)
                         ELSE  MIN(TB_FLOODING.INSDUE         ) END
                   ,CASE WHEN (MIN(TB_FLOODING.FLOODING_INSDUE) <= @PRM_DTE) THEN
                               MIN(TB_FLOODING.FLOODING_INSDUE)
                         ELSE  @PRM_DTE END) AS FLOODING_DAY
         --, SUM(TB_FLOODING.FLOODING_DAY) AS FLOODING_DAY
         --, MAX(TB_FLOODING.DPD) - SUM(TB_FLOODING.FLOODING_DAY) AS DPD_FLOODING
    FROM (
    SELECT HPTINS00_1.INSCRN AS INSCRN
         , HPTINS00_1.INSITM AS INSITM
         , HPTINS00_1.INSDUE AS INSDUE
         , ISNULL(HPTINS00_2.INSDUE,NULL) AS FLOODING_INSDUE
         , ISNULL(HPTINS00_2.INSFRD,NULL) AS FLOODING_INSFRD
         , ISNULL(HPTINS00_2.INSTOD,NULL) AS FLOODING_INSTOD
         , DATEDIFF(DAY
                   ,HPTINS00_1.INSDUE
                   ,@PRM_DTE) AS DPD
/*
         , CASE WHEN (ISNULL(HPTINS00_2.INSFRD,0) = 0) OR (ISNULL(HPTINS00_2.INSDUE,0) = 0) THEN 0
                WHEN (HPTINS00_2.INSDUE <= @PRM_DTE) THEN
                     DATEDIFF(DAY
                             ,HPTINS00_2.INSFRD
                             ,HPTINS00_2.INSDUE)
                WHEN (HPTINS00_2.INSFRD <= @PRM_DTE) THEN
                      DATEDIFF(DAY
                             ,HPTINS00_2.INSFRD
                             ,@PRM_DTE)
                ELSE 0 END AS FLOODING_DAY
*/
      FROM LLSPDTA.dbo.NCB_HPTINS00 HPTINS00_1
      LEFT JOIN (SELECT HPDT01600_SUB.INSCBR
                      , HPDT01600_SUB.INSCPM
                      , HPDT01600_SUB.INSCPT
                      , HPDT01600_SUB.INSCRN
                      , HPDT01600_SUB.INSITM
                      , HPDT01600_SUB.INSDUE
                      , HPDT01600_SUB.INSOLD
                      , CASE WHEN HPDT01600_SUB.INSFRD IS NOT NULL THEN HPDT01600_SUB.INSFRD
                             ELSE ISNULL((SELECT HPDT01600_FRD.INSFRD
                                            FROM LLSPDTA.dbo.NCB_HPDT01600 HPDT01600_FRD
                                           WHERE HPDT01600_FRD.INSCBR  = HPDT01600_SUB.INSCBR
                                             AND HPDT01600_FRD.INSCPM  = HPDT01600_SUB.INSCPM
                                             AND HPDT01600_FRD.INSCPT  = HPDT01600_SUB.INSCPT
                                             AND HPDT01600_FRD.INSCRN  = HPDT01600_SUB.INSCRN
                                             AND HPDT01600_SUB.INSOLD >= HPDT01600_FRD.INSFRD
                                             AND HPDT01600_SUB.INSOLD <= HPDT01600_FRD.INSTOD),NULL)
                        END AS INSFRD
                      , HPDT01600_SUB.INSTOD
                   FROM LLSPDTA.dbo.NCB_HPDT01600 HPDT01600_SUB
                  WHERE HPDT01600_SUB.INSCBR = @PRM_BRN
                    AND HPDT01600_SUB.INSCPM = @PRM_PDM
                    AND HPDT01600_SUB.INSCPT = @PRM_PDT
                    AND HPDT01600_SUB.INSCRN = @PRM_RUN) HPTINS00_2 ON (HPTINS00_1.INSCBR = HPTINS00_2.INSCBR
                                                                    AND HPTINS00_1.INSCPM = HPTINS00_2.INSCPM
                                                                    AND HPTINS00_1.INSCPT = HPTINS00_2.INSCPT
                                                                    AND HPTINS00_1.INSCRN = HPTINS00_2.INSCRN
                                                                    AND HPTINS00_1.INSITM = HPTINS00_2.INSITM)
     WHERE HPTINS00_1.INSCBR = @PRM_BRN
       AND HPTINS00_1.INSCPM = @PRM_PDM
       AND HPTINS00_1.INSCPT = @PRM_PDT
       AND HPTINS00_1.INSCRN = @PRM_RUN
       AND ((HPTINS00_1.INSF11 <> 0) OR (HPTINS00_1.INSF21 <> 0))
       AND HPTINS00_1.INSDUE <= @PRM_DTE
    ) TB_FLOODING
    GROUP BY TB_FLOODING.INSCRN
    ) TB_RESULT

	RETURN ISNULL(@RESULT,0);
END
GO
/****** Object:  StoredProcedure [dbo].[sp_getEmailRelatedDtl]    Script Date: 05/09/2012 11:43:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--exec sp_getEmailRelatedDtl '8100003'
drop procedure sp_getEmailRelatedDtl

CREATE procedure [dbo].[sp_getEmailRelatedDtl] 
@ConNo varchar(10)  
as
begin
--declare @ConNo varchar(10)  
declare @email varchar(255)
declare @deaCode varchar(10)
declare @Taxrate decimal(18,0)
--set @ConNo='8100004'--'8100055';
-- get Dealer Code
--
select @deaCode=CONDEA from HPMCON00 where CONRUN=@ConNo
select @Taxrate=CQMVA1 from CQDM008 where CQMCDE='WHT_RATE'


select @email=a.ADREMA
from DBMADR00 a where  ADRCON=@ConNo and a.ADREMA is not null 

if object_id( 'tempdb..#temp0001' ) is not  null drop table #temp0001

select a.ADREMA as EMAIL,b.CONDEA,b.CONCUS
	into #temp0001	
	from DBMADR00 a  
	left join HPMCON00 b on a.ADRCON=b.CONRUN
where 	
	a.ADREMA is not null 
	and a.ADREMA=@email
group by 
	a.ADREMA,b.CONDEA,b.CONCUS	
	 
			--select * from #temp0001 a 

			declare @_email varchar(255)
			declare @_condea varchar(4)
			declare @_concus varchar(4)
			declare @rowcount int
			
			set @rowcount=0
			
			if object_id( 'tempdb..#temp0002' ) is not  null drop table #temp0002


			declare  c1 cursor for 
					select * from #temp0001 a 
			open c1
			fetch  next from c1 into @_email,@_condea,@_concus
			while @@fetch_status=0 
			begin
					--print @_email
					if @rowcount=0 
					begin
						select @_email as EMAIL,@_condea as CONDEA ,@_concus as CONCUS,
							b.INSCRN,MIN(INSITM) INSITM	
						into #temp0002
						from HPMCON00 a  
						left join HPTINS00 b on a.CONRUN = b.INSCRN and INSF11=3 
						where a.CONDEA=@_condea
						and exists(
							select INSCRN from HPTINS00 where INSCRN=a.CONRUN and INSF11=3 
						)
						group by b.INSCRN
						order by b.INSCRN
					end else 
					begin
						insert #temp0002
						select @_email as EMAIL,@_condea as CONDEA ,@_concus as CONCUS,
							b.INSCRN,MIN(INSITM) INSITM	
						from HPMCON00 a  
						left join HPTINS00 b on a.CONRUN = b.INSCRN and INSF11=3 
						where a.CONDEA=@_condea
						and exists(
							select INSCRN from HPTINS00 where INSCRN=a.CONRUN and INSF11=3 
						)
						group by b.INSCRN
						order by b.INSCRN					
					end
					
					set @rowcount=@rowcount+1

				fetch  next from c1 into @_email,@_condea,@_concus
			end

			close c1
			deallocate c1


if object_id( 'tempdb..#temp0002' ) is not  null 
begin


	select 0 as CHK,a.*,b.* ,
		case 
			when c.CONPER<36 then ((b.INSIAM*@Taxrate)/100) else 0
		end as WHT 
	,
		case 
			when c.CONPER<36 then (b.INSIAM-((b.INSIAM*@Taxrate)/100)+b.INSVAM) else (INSIAM+INSVAM)
		end as NET 		
	
	from #temp0002 a
	left join HPTINS00 b on a.INSCRN=b.INSCRN and a.INSITM=b.INSITM 
	left join (
		select top 1 * from HPMCON00 
	) as c on a.INSCRN=c.CONRUN 
	--left join HPMCON00 c on a.INSCRN=c.CONRUN 
	order by a.CONCUS
end else
	select 0 as CHK,
	a.* from HPTINS00 a
	where a.INSCRN='A'	
end
GO
/****** Object:  StoredProcedure [dbo].[sp_getEmailRelated]    Script Date: 05/09/2012 11:43:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--exec sp_getEmailRelated '8100055'
drop procedure sp_getEmailRelated

CREATE procedure [dbo].[sp_getEmailRelated] 
@ConNo varchar(10)  
as
begin
--declare @ConNo varchar(10)  
declare @email varchar(255)
declare @deaCode varchar(10)
--set @ConNo='8100004'--'8100055';
-- get Dealer Code
--
select @deaCode=CONDEA from HPMCON00 where CONRUN=@ConNo


select @email=a.ADREMA
from DBMADR00 a where  ADRCON=@ConNo and a.ADREMA is not null 


if object_id( 'tempdb..#temp0001' ) is not  null drop table #temp0001
/*
select b.EMAIL,a.CONDEA,a.CONCUS
	into #temp0001	
	from HPMCON00 a  
	left join HTLC_APP.dbo.HLTC_C_ADDRESS b on a.CONCUS=b.CENTER_CODE
where 	
	b.EMAIL is not null 
	and b.EMAIL=@email
group by 
	b.EMAIL,a.CONDEA,a.CONCUS
	*/
	
	
select a.ADREMA as EMAIL,b.CONDEA,d.[DLR Name] as DEANAME,b.CONCUS
	into #temp0001	
	from DBMADR00 a  
	left join HPMCON00 b on a.ADRCON=b.CONRUN	
	left join DEALER d on b.CONDEA= d.Code
where 	
	a.ADREMA is not null 
	and a.ADREMA=@email
group by 
	a.ADREMA,b.CONDEA,b.CONCUS,d.[DLR Name]		
	 
			--select * from #temp0001 a 

			declare @_email varchar(255)
			declare @_condea varchar(4)
			declare @_deaname varchar(200)
			declare @_concus varchar(4)
			declare @rowcount int
			
			set @rowcount=0
			
			if object_id( 'tempdb..#temp0002' ) is not  null drop table #temp0002


			declare  c1 cursor for 
					select * from #temp0001 a 
			open c1
			fetch  next from c1 into @_email,@_condea,@_deaname,@_concus
			while @@fetch_status=0 
			begin
					--print @_email
					if @rowcount=0 
					begin
						select @_email as EMAIL,@_condea as CONDEA ,@_deaname as DEANAME,@_concus as CONCUS,
							b.INSCRN,MIN(INSITM) INSITM	
						into #temp0002
						from HPMCON00 a  					
						left join HPTINS00 b on a.CONRUN = b.INSCRN and INSF11=3
						where a.CONDEA=@_condea
						and exists(
							select INSCRN from HPTINS00 where INSCRN=a.CONRUN and INSF11=3 
						)
						group by b.INSCRN
						order by b.INSCRN
					end else 
					begin
						insert #temp0002
						select @_email as EMAIL,@_condea as CONDEA ,@_deaname as DEANAME ,@_concus as CONCUS,
							b.INSCRN,MIN(INSITM) INSITM	
						from HPMCON00 a  
						left join HPTINS00 b on a.CONRUN = b.INSCRN and INSF11=3 
						where a.CONDEA=@_condea
						and exists(
							select INSCRN from HPTINS00 where INSCRN=a.CONRUN and INSF11=3 
						)
						group by b.INSCRN
						order by b.INSCRN					
					end
					
					set @rowcount=@rowcount+1

				fetch  next from c1 into @_email,@_condea,@_deaname,@_concus
			end

			close c1
			deallocate c1


if object_id( 'tempdb..#temp0002' ) is not  null 
begin
	--select 0 as CHK,a.*,b.* from #temp0002 a
	--left join HPTINS00 b on a.INSCRN=b.INSCRN and a.INSITM=b.INSITM
	select EMAIL,CONDEA,DEANAME,CONCUS from #temp0002	
	group by EMAIL,CONDEA,DEANAME,CONCUS
end else
	select 0 as CHK,
	a.* from HPTINS00 a
	where a.INSCRN='A'	
end
GO
/****** Object:  StoredProcedure [dbo].[SP_GETHISTORY]    Script Date: 05/09/2012 11:43:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--EXEC SP_GETHISTORY '8100169'
drop procedure SP_GETHISTORY

CREATE PROCEDURE [dbo].[SP_GETHISTORY]
	@CONTRACT VARCHAR (10)
AS
BEGIN
	DECLARE @TODAY DATETIME
	DECLARE @MONTH INT
	DECLARE @YEAR  INT
	
	SET @TODAY = {FN NOW()}
	SET @MONTH = MONTH(@TODAY)
	SET @YEAR  = YEAR(@TODAY)
	
	IF (@MONTH - 1 = 0)
		BEGIN
			SET @MONTH = 12
			SET @YEAR  = @YEAR -1		
		END
	ELSE
		BEGIN
			SET @MONTH = @MONTH -1
		END
		
	DECLARE @DEA VARCHAR(10)	
	SELECT @DEA=CONDEA FROM HPMCON00 WHERE CONRUN=@CONTRACT
	
if object_id( 'tempdb..#M007_S003' ) is not  null drop table #M007_S003
	
	SELECT IDENTITY( int ) AS idcol,0 as CQMCHK,A.* ,B.*
	INTO #M007_S003
	FROM CQDM007 A
	LEFT JOIN CQDS003  B ON A.CQMDNO=B.CQSDNO
	LEFT JOIN HPMCON00 C ON B.CQSCSN=C.CONRUN
	WHERE 
	 (MONTH(A.CQMDTE)=@MONTH) 
	  AND (YEAR(A.CQMDTE)=@YEAR)
	 AND 
	  (C.CONDEA=@DEA)
	  AND (B.CQSRCT<>'O')
	ORDER BY B.CQSDNO,B.CQSCSN
	
	SELECT * FROM #M007_S003 ORDER BY idcol 	  

END
GO
/****** Object:  StoredProcedure [dbo].[sp_Mail]    Script Date: 05/09/2012 11:44:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
drop procedure sp_Mail

CREATE PROCEDURE [dbo].[sp_Mail] @param1  varchar(15) ,@param2 varchar(80) ,@paramDate1 varchar(30) ,@paramDate2 varchar(30) 

AS
BEGIN
	declare @CCC int
	declare @CONTRACT VARCHAR (8)
	DECLARE @DateNaVoy DATETIME
	declare @DNO VARCHAR (15)
	
	UPDATE CQDT001 SET CQTCON=NULL,CQTREM='W' WHERE CQTSTS='W'
	
	IF OBJECT_ID( 'TEMPDB..#mail' ) IS NOT NULL DROP TABLE #mail
	CREATE TABLE #mail (
		DateNaVoy DATETIME,
		Con varchar (8),
		CountData int
	)
	DECLARE db_cursor1 CURSOR FOR 
	SELECT CONVERT(DATETIME,CONVERT(VARCHAR,A.CQTETD,101),101) AS DATENAVOY
	FROM  CQDT001 A
	LEFT JOIN  CQDM007 B ON A.CQTDNO=B.CQMDNO
	LEFT JOIN  CQDS003 C ON B.CQMDNO=C.CQSDNO
	WHERE A.CQTSTS='W'
	group by CONVERT(DATETIME,CONVERT(VARCHAR,A.CQTETD,101),101)
	OPEN db_cursor1  
	FETCH NEXT FROM db_cursor1 INTO @DateNaVoy	
	WHILE @@FETCH_STATUS = 0  
	BEGIN  		
		DECLARE db_cursor2 CURSOR FOR 
		SELECT F.CQSCSN
		FROM  CQDT001 D
		LEFT JOIN  CQDM007 E ON D.CQTDNO=E.CQMDNO
		LEFT JOIN  CQDS003 F ON E.CQMDNO=F.CQSDNO
		WHERE D.CQTSTS='W'
		group by F.CQSCSN
		OPEN db_cursor2  
		FETCH NEXT FROM db_cursor2 INTO @CONTRACT	
		WHILE @@FETCH_STATUS = 0  
		BEGIN  
			SELECT @CCC=COUNT(H.CQMDNO)
			FROM  CQDT001 G
			LEFT JOIN  CQDM007 H ON G.CQTDNO=H.CQMDNO
			LEFT JOIN  CQDS003 I ON H.CQMDNO=I.CQSDNO
			where DAY(G.CQTETD)=DAY(@DateNaVoy) 
			  and month(G.CQTETD)=month(@DateNaVoy) 
			  and year(G.CQTETD)=year(@DateNaVoy) 
			  and I.CQSCSN=@CONTRACT 
			  and G.CQTSTS='W'
			INSERT INTO #mail VALUES(@DateNaVoy,@CONTRACT,@CCC)
			
		FETCH NEXT FROM db_cursor2 INTO @CONTRACT 
		END 
		CLOSE db_cursor2  
		DEALLOCATE db_cursor2 
	FETCH NEXT FROM db_cursor1 INTO @DateNaVoy  
	END	
	CLOSE db_cursor1  
	DEALLOCATE db_cursor1
	
	--SELECT * FROM #MAIL
	
	DECLARE db_cursor3 CURSOR FOR 
	SELECT DateNaVoy,con FROM #mail order by countdata,CAST(CON AS INTEGER) desc
	OPEN db_cursor3  
	FETCH NEXT FROM db_cursor3 INTO @DateNaVoy,@CONTRACT
	WHILE @@FETCH_STATUS = 0  
	BEGIN
		DECLARE db_cursor4 CURSOR FOR
		SELECT H.CQMDNO
		FROM  CQDT001 G
		LEFT JOIN  CQDM007 H ON G.CQTDNO=H.CQMDNO
		LEFT JOIN  CQDS003 I ON H.CQMDNO=I.CQSDNO
		where DAY(G.CQTETD)=DAY(@DateNaVoy) 
		 and month(G.CQTETD)=month(@DateNaVoy) 
		 and year(G.CQTETD)=year(@DateNaVoy) 
		 and CQSCSN=@CONTRACT 
		 and G.CQTSTS='W'  
		OPEN db_cursor4  
		FETCH NEXT FROM db_cursor4 INTO @DNO
		WHILE @@FETCH_STATUS = 0  
		  BEGIN
			 
			update  CQDT001 set CQTCON=@CONTRACT Where CQTDNO=@DNO AND (CQTCON='' OR CQTCON IS NULL)
			
			FETCH NEXT FROM db_cursor4 INTO @DNO
		  END	
		CLOSE db_cursor4  
		DEALLOCATE db_cursor4
		FETCH NEXT FROM db_cursor3 INTO @DateNaVoy,@CONTRACT 
	END	
	CLOSE db_cursor3  
	DEALLOCATE db_cursor3
	
	select c.EMAIL
	     ,A.CQTSTS
		 ,A.CQTSTS AS FT
	     ,A.CQTRNO
	     ,A.CQTREM
	     ,convert(datetime,CONVERT(DATE,A.CQTETD))as DRC
	     ,(d.TH_FIRST_NAME + ' ' + d.TH_LAST_NAME)as FullName
	     ,b.CONDEA
	     ,A.CQTCON	  
	     ,COUNT(a.cqtcon)as item
	     ,SUM(e.cqmamt) as totalamount
	from  CQDT001 A
	left join  HPMCON00 b on A.CQTCON=b.CONRUN
	left join HTLC_APP.dbo.HLTC_C_ADDRESS c on b.CONCUS=c.CENTER_CODE
	left join HTLC_APP.dbo.HLTC_C_CENTER d on b.CONCUS=d.CENTER_CODE
	left join  CQDM007 e on A.CQTDNO=e.CQMDNO
	--where CQTSTS='W'  
	where 
	(
	(rtrim(ltrim(@param1))='CQTCON') and (a.CQTCON  like '%'+@param2+'%' )and CQTDRC between @paramDate1 and @paramDate2 
	)
	or 
	(
	((rtrim(ltrim(@param1))='FULLNAME') and 
	(d.TH_FIRST_NAME + ' ' + d.TH_LAST_NAME) like '%'+@param2+'%' )and CQTDRC between @paramDate1 and @paramDate2
	)
	or 
	(
	((rtrim(ltrim(@param1))='CONDEA') and (b.CONDEA  like '%'+@param2+'%' )and CQTDRC between @paramDate1 and @paramDate2
	)
	)
	or 
	(
	((rtrim(ltrim(@param1))='Email') and (c .email  like '%'+@param2+'%' )and CQTDRC between @paramDate1 and @paramDate2
	)
	)
	or 
	(
	((rtrim(ltrim(@param1))='')and CQTDRC between @paramDate1 and @paramDate2
	)
	)
	-- or 
	-- (
	-- ((rtrim(ltrim(@param1))='')
	-- )
	 --)
--exec sp_mail '','8100053','1/1/2000','4/4/2012'
	
	group by c.EMAIL,(d.TH_FIRST_NAME + ' ' + d.TH_LAST_NAME),b.CONDEA,A.CQTCON,CONVERT(DATE,A.CQTETD),A.CQTSTS,A.CQTRNO,A.CQTREM
	order by cqtcon 

END
GO
/****** Object:  StoredProcedure [dbo].[sp_RCBatchIU]    Script Date: 05/09/2012 11:44:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- exec sp_RCBatchIU '201201204100125'
drop procedure sp_RCBatchIU

CREATE procedure [dbo].[sp_RCBatchIU]
--ON [dbo].[CQDM011]
--AFTER INSERT, UPDATE, DELETE 
@RFDNO as  varchar(15)

AS
	--declare @RFDNO as  varchar(15)

		
	
--select @RFDNO=CQMRFN from inserted	
	--select * from CQDM011
	
declare @DNO varchar(15)  --12
declare @CNO varchar(7)
declare @CSN varchar(7)
declare @RTM varchar(12)

declare @BNK varchar(12)
declare @BBR varchar(12)

declare @ACT varchar(1)
declare @STS varchar(1)
declare @MTD datetime
declare @CQP varchar(50) 



declare @NEWDOCNO varchar(12)

set @DNO=@RFDNO

select @CNO=CQMCNO,@CSN=CQMCSN,@BNK=CQMBNK,@BBR=CQMBBR,@RTM=RIGHT(CQMTNO,12) 
,@NEWDOCNO=RIGHT(CQMDNO,12)
from CQDM007 where CQMDNO=@DNO


if  exists(
	select * from HPTRCH00 where RCHRFN = @CNO and RCHBBN=@BNK and RCHBBR=@BBR
)
begin  -- update
	/*
	select 
		@CQP=c.CQMNAE,@STS=b.CQMSTS
	from CQDM007 a
	left join CQDM011 b on a.CQMCNO=b.CQMNO2
	left join CQDM002 c on b.CQMSTS=c.CQMCDE  -- master chq code
	where a.CQMDNO=@DNO
	and a.CQMACT='A'
	*/
	
	select 
		@CQP=c.CQMNAE,@STS=a.CQMSTS,@ACT=a.CQMACT,@MTD=a.CQMMTD
	from CQDM011 a
	left join CQDM002 c on a.CQMSTS=c.CQMCDE  -- master chq code
	where a.CQMNO2=@CNO and a.CQMBNK=@BNK and a.CQMBBR=@BBR
	--and a.CQMACT='A'	
		
	
	--update HPTRCH00 set RCHCQT=@STS,RCHCQP=@CQP,RCHACT=@ACT,RCHMTM=@MTD  where RCHRFN = @CNO and RCHBBN=@BNK and RCHBBR=@BBR
    update HPTRCH00 set RCHCQT=@STS,RCHACT=@ACT,RCHMTM=@MTD  where RCHRFN = @CNO and RCHBBN=@BNK and RCHBBR=@BBR	
end
else
begin -- insert new record

	--insert into HPTRCB00   --RCB
	select 
	CQMACT,'2' as CQMPST,null as CQMPSD
	,'2' as CQMFL1,'2' as CQMFL2,'I' as  CQMFL3,CQMBRN,CQMPDM,CQMPDT
	,@NEWDOCNO as CQMDNO1,@RTM as CQMTNO,CQMETD
	,CQMETU,'2' as CQMDCT,CQMAMT,CQMETD,CQMETD,CQMETU,CQMMTD,CQMMTD,CQMMTU
	from CQDM007 where CQMDNO=@DNO
	and CQMACT='A'


	/*
	insert into HPTRCH00   --RCH
	select 
	CQMACT,'2' as CQMPST,null as CQMPSD,'2' as CQMFL1,'2' as CQMFL2
	,'I' as  CQMFL3,CQMBRN,CQMPDM,CQMPDT,@NEWDOCNO as CQMDNO,'00' as CQMITM
	,'1' as CQMRBY,CQMBNK,CQMBBR,CQMCNO,CQMDTE,CQMAMT,'01' as CQMACN,'' as CQMCQP
	,null as CQMCQT,CQMETD,CQMETD,CQMETU,CQMMTD,CQMMTD,CQMMTU
	from CQDM007 where CQMDNO=@DNO
	and CQMACT='A'
	*/
	
	--insert into HPTRCH00   --RCH
	select 
		a.CQMACT,'2' as CQMPST,null as CQMPSD,'2' as CQMFL1,'2' as CQMFL2
		,'I' as  CQMFL3,a.CQMBRN,a.CQMPDM,a.CQMPDT,@NEWDOCNO as CQMDNO,'00' as CQMITM
		,'1' as CQMRBY,a.CQMBNK,a.CQMBBR,a.CQMCNO,CQMDTE,a.CQMAMT,'01' as CQMACN,
		--c.CQMNAE as  CQMCQP
		'' as  CQMCQP
		,b.CQMSTS as CQMCQT,a.CQMETD,a.CQMETD,a.CQMETU,a.CQMMTD,a.CQMMTD,a.CQMMTU
	from CQDM007 a
	left join CQDM011 b on a.CQMCNO=b.CQMNO2
	left join CQDM002 c on b.CQMSTS=c.CQMCDE  -- master chq code
	where a.CQMDNO=@DNO
	and a.CQMACT='A'
	
	


	--insert into HPTRCD00
	/*
	select 
	'A' as CQSACT,'2' as CQMPST,null as CQMPSD,'D' as CQMFL1,'' as CQMFL2,null as CQMFL3
	,CQSBRN,CQSPDM,CQSPDT,@NEWDOCNO as CQMDNO
	,'00' as CQSITM,CQSSEQ
	,'01' as CQSCBN,'2' as CQSCPM,'01' as CQSCPT
	,CQSCSN,'013' as CQSRTY,CQSNET -- amount
	,'1' as CQSRFR,'1' as CQSRTO
	,CQSETD,CQSETD,CQSETU
	,CQSMTD,CQSMTD,CQSMTU
	,null as CQSREF
	,0 as CQSICA
	from CQDS003 where  CQSDNO=@DNO
	*/
	
	select 
	'A' as CQSACT,'2' as CQMPST,null as CQMPSD,'D' as CQMFL1,'' as CQMFL2,null as CQMFL3
	,CQSBRN,CQSPDM,CQSPDT,@NEWDOCNO as CQMDNO
	,'00' as CQSITM,1 as CQSSEQ
	,'01' as CQSCBN,'2' as CQSCPM,'01' as CQSCPT
	,CQSCSN,'013' as CQSRTY,CQSAMT -- amount
	,'1' as CQSRFR,'1' as CQSRTO
	,CQSETD,CQSETD,CQSETU
	,CQSMTD,CQSMTD,CQSMTU
	,null as CQSREF
	,0 as CQSICA
	from CQDS003 where  CQSDNO=@DNO and CQSRCT='N'
	
	union
	select 
	'A' as CQSACT,'2' as CQMPST,null as CQMPSD,'D' as CQMFL1,'' as CQMFL2,null as CQMFL3
	,CQSBRN,CQSPDM,CQSPDT,@NEWDOCNO as CQMDNO
	,'00' as CQSITM,2 as CQSSEQ
	,'01' as CQSCBN,'2' as CQSCPM,'01' as CQSCPT
	,CQSCSN,'094' as CQSRTY,CQSVAT -- amount
	,'1' as CQSRFR,'1' as CQSRTO
	,CQSETD,CQSETD,CQSETU
	,CQSMTD,CQSMTD,CQSMTU
	,null as CQSREF
	,0 as CQSICA
	from CQDS003 where  CQSDNO=@DNO and CQSRCT='N'	
		
	union
	select 
	'A' as CQSACT,'2' as CQMPST,null as CQMPSD,'D' as CQMFL1,'' as CQMFL2,null as CQMFL3
	,CQSBRN,CQSPDM,CQSPDT,@NEWDOCNO as CQMDNO
	,'00' as CQSITM,3 as CQSSEQ
	,'01' as CQSCBN,'2' as CQSCPM,'01' as CQSCPT
	,CQSCSN,'F81' as CQSRTY,CQSWHT -- amount
	,'1' as CQSRFR,'1' as CQSRTO
	,CQSETD,CQSETD,CQSETU
	,CQSMTD,CQSMTD,CQSMTU
	,null as CQSREF
	,0 as CQSICA
	from CQDS003 where  CQSDNO=@DNO and CQSRCT='N'	 and CQSWHT<>0
	
	union
	select 
	'A' as CQSACT,'2' as CQMPST,null as CQMPSD,'D' as CQMFL1,'' as CQMFL2,null as CQMFL3
	,CQSBRN,CQSPDM,CQSPDT,@NEWDOCNO as CQMDNO
	,'00' as CQSITM,4 as CQSSEQ
	,'01' as CQSCBN,'2' as CQSCPM,'01' as CQSCPT
	,CQSCSN,CQSRS1 as CQSRTY,CQSNET -- amount
	,'1' as CQSRFR,'1' as CQSRTO
	,CQSETD,CQSETD,CQSETU
	,CQSMTD,CQSMTD,CQSMTU
	,null as CQSREF
	,0 as CQSICA
	from CQDS003 where  CQSDNO=@DNO and CQSRCT='O' and CQSNET<>0	


end
GO
/****** Object:  StoredProcedure [dbo].[sp_getPayRelatedHdr]    Script Date: 05/09/2012 11:43:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
exec sp_getPayRelatedHdr '8100043'
select * from HPTINS00

*/
-- drop procedure sp_getPayRelated 
drop procedure sp_getPayRelatedHdr

CREATE procedure [dbo].[sp_getPayRelatedHdr] 
 @ConNo varchar(10)  
as
begin


--declare @ConNo varchar(10)
declare @DocNo varchar(15)

--set @ConNo='8100043';
	 
	select 
		@DocNo=CQMDNO
	from CQDM007 a  where CQMCSN=@ConNo
	select * from CQDM007 where CQMCSN=@DocNo order by CQMCSN

end
GO
/****** Object:  StoredProcedure [dbo].[SP_UPDATERECEIVE]    Script Date: 05/09/2012 11:44:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
drop procedure SP_UPDATERECEIVE

CREATE PROCEDURE [dbo].[SP_UPDATERECEIVE]
		@CHQ_NUM VARCHAR (10),
		@CHQ_DAT DATETIME,
		@CHQ_AMT NUMERIC (18,2),
		@CHQ_CTY CHAR (1),
		@CHQ_ACC VARCHAR (12),
		@CHQ_BNK CHAR (3),
		@CHQ_BBR CHAR (4),
		@REC_DNO VARCHAR (15),
		@CONTRACT VARCHAR (10),
		@BRN VARCHAR (3),
		@PDM VARCHAR (4),
		@PDT VARCHAR (3),
		@ETW VARCHAR (60),
		@ETU VARCHAR (20),
		@GOODS DECIMAL (18,2),
		@VAT DECIMAL (18,2),
		@WT DECIMAL (18,2),
		@EXPECDATE datetime
AS
BEGIN
	DECLARE @CCC INT
	SELECT @CCC=COUNT(*) 
	FROM CQDM007 A
	LEFT JOIN CQDS003 B ON A.CQMDNO=B.CQSDNO
	WHERE A.CQMDNO=@REC_DNO
	  AND A.CQMBBR=@CHQ_BBR
	  AND A.CQMBNK=@CHQ_BNK
	  AND A.CQMCNO=@CHQ_NUM
	  AND A.CQMDTE=@CHQ_DAT
	  AND A.CQMAMT=@CHQ_AMT
	  AND B.CQSCSN=@CONTRACT
	  
	IF @CCC > 0
		BEGIN
			UPDATE CQDM007 SET 
				CQMACC=@CHQ_ACC,
				CQMCTY=@CHQ_CTY,
				CQMDUE=@EXPECDATE,
				CQMDFG='R'
			WHERE CQMDNO=@REC_DNO	
		END
	ELSE
		BEGIN
			INSERT INTO CQDM007 
			   ([CQMACT]
			   ,[CQMSTS]
			   ,[CQMDFG]
			   ,[CQMBRN]
			   ,[CQMPDM]
			   ,[CQMPDT]
			   ,[CQMDNO]
			   ,[CQMACC]
			   ,[CQMBNK]
			   ,[CQMBBR]
			   ,[CQMCNO]
			   ,[CQMCTY]
			   ,[CQMDTE]
			   ,[CQMDUE]
			   ,[CQMITM]
			   ,[CQMAMT]
			   ,[CQMCSN]
			   ,[CQMETD]
			   ,[CQMETW]
			   ,[CQMETU])
			VALUES 
			   ('A'
			   ,'D'
			   ,'R'
			   ,@BRN
			   ,@PDM
			   ,@PDT
			   ,@REC_DNO
			   ,@CHQ_ACC
			   ,@CHQ_BNK
			   ,@CHQ_BBR
			   ,@CHQ_NUM
			   ,@CHQ_CTY
			   ,@CHQ_DAT
			   ,@EXPECDATE
			   ,1
			   ,@CHQ_AMT
			   ,@CONTRACT
			   ,{FN NOW()}
			   ,@ETW
			   ,@ETU)
			
			INSERT INTO CQDS003
			   ([CQSACT]
			   ,[CQSSTS]
			   ,[CQSBRN]
			   ,[CQSPDM]
			   ,[CQSPDT]
			   ,[CQSDNO]
			   ,[CQSSEQ]
			   ,[CQSRCT]
			   ,[CQSAMT]
			   ,[CQSCSN]
			   ,[CQSVAT]
			   ,[CQSWHT]
			   ,[CQSNET]
			   ,[CQSADF]
			   ,[CQSCFA]
			   ,[CQSPFA]
			   ,[CQSWFA]           
			   ,[CQSETD]
			   ,[CQSETW]
			   ,[CQSETU])
	           
			VALUES
			   ('A'
			   ,'A'
			   ,@BRN
			   ,@PDM
			   ,@PDT
			   ,@REC_DNO
			   ,1
			   ,'N'
			   ,@GOODS
			   ,@CONTRACT
			   ,@VAT
			   ,@WT
			   ,@CHQ_AMT
			   ,0
			   ,1
			   ,'Y'
			   ,'Y'
			   ,{FN NOW()}
			   ,@ETW
			   ,@ETU)
		END	
END
GO
/****** Object:  UserDefinedFunction [dbo].[fn_GetChqPaymentByDue]    Script Date: 05/09/2012 11:44:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--select * from fn_GetChqPaymentByDue('8100053',5)
drop function fn_GetChqPaymentByDue

CREATE FUNCTION [dbo].[fn_GetChqPaymentByDue] ( @CSN varchar(15),@MONTH int )
RETURNS @ChqPayment  TABLE
   (
   CQSCSN varchar(15),
   CQMDUE datetime,
   CQSADV decimal(18,2),
   INSCRN varchar(15),
   INSDUE datetime,
   INSITM int,
   INSIAM decimal(18,2),
   INSVAM decimal(18,2),
   INSIRA decimal(18,2),
   WHT decimal(18,2),
   INSNET decimal(18,2),
   LSTPAY decimal(18,2),   
   ACCUM decimal(18,2),
   ADVDIFF decimal (18,2)
   )
AS
BEGIN


--declare @CSN as varchar(15)
--set @CSN='8100002'--'8100053'

insert into @ChqPayment
select 
rcv.*,ins.*,(ins.INSNET+ins.LSTPAY) as ACCUM, (ins.INSNET-(rcv.CQSADV+ins.INSIRA) ) as ADVDIFF
from
(   --# RECEIVE
	select aa.CQSCSN,bb.CQMDUE,SUM(aa.CQSADV) as CQSADV
	from 
	(
		select 
			b.CQMCNO,b.CQMCFA,a.CQSCSN,CQMDUE,a.CQSAMT,a.CQSVAT
			,a.CQSWHT,a.CQSNET,a.CQSRCT,a.CQSADF,a.CQSCFA,a.CQSWFA,a.CQSPFA
			,case 
			 when a.CQSWFA='Y' then 
				((a.CQSAMT+a.CQSVAT) - a.CQSWHT ) --+ (a.CQSADF*a.CQSCFA) 
				--a.CQSAMT
			  else 
				a.CQSAMT+a.CQSVAT --+ (a.CQSADF*a.CQSCFA)
			 end
			 as CQSADV
		from CQDS003  a
		left join CQDM007 b on a.CQSDNO=b.CQMDNO
		where 
		a.CQSRCT='N'					   -- 'O' = Other , 'N' = Normal
		and (b.CQMCFA<>'P'  or  b.CQMCFA is null)							   -- 'P' = Chq. Pass status
		and a.CQSCSN=@CSN		
		and month(b.CQMDUE)<=@MONTH
	) aa
	left join (
			 select max(b.CQMDUE) CQMDUE,a.CQSCSN from CQDS003 a 
			 left join CQDM007 b on a.CQSDNO=b.CQMDNO
			  where  a.CQSCSN=@CSN
			 group by a.CQSCSN
		) bb on aa.CQSCSN=bb.CQSCSN
	group by aa.CQSCSN,bb.CQMDUE
) rcv

--###################################################
right join
(	--## INSTALLMENT
	select 
		a.INSCRN,a.INSDUE,a.INSITM,a.INSIAM,a.INSVAM,a.INSIRA,
		case 
		 when b.CONPER<36 then ((5*(a.INSIAM + a.INSVAM))/100) 
		 else 0 
		 end WHT
		,
		case 
		 when b.CONPER<36 then (a.INSIAM + a.INSVAM) - (5*(a.INSIAM + a.INSVAM))/100  
		else (a.INSIAM + a.INSVAM)
		end
		as INSNET
	,(
		select 
			case 
			when c.CONPER<36 then (SUM((b.INSIAM+b.INSVAM) - (5*(b.INSIAM+b.INSVAM))/100 ))
			else (SUM(b.INSIAM+b.INSVAM))		
			end
			as xx
		from HPTINS00 b 
		left join HPMCON00 c on b.INSCRN=c.CONRUN
		where b.INSCRN=@CSN and b.INSDUE<MIN(a.INSDUE)
		group by b.INSCRN,c.CONPER
	)as LSTPAY 
	 
		
	from HPTINS00 a
	left join HPMCON00 b on a.INSCRN=b.CONRUN
	where a.INSCRN=@CSN and a.INSF11=3
	and month(a.INSDUE)<=month({fn NOW()})
	group by a.INSCRN,a.INSDUE,a.INSIAM,a.INSVAM,a.INSITM,a.INSVAM,a.INSVRA,a.INSIRA,b.CONPER
	--order by INSDUE
) ins on rcv.CQSCSN=ins.INSCRN

return
end

--select * from HPTINS00 where INSCRN='8100053' and INSF11=3
/*
select * from CQDM007
update CQDM007 set CQMCFA='A'
select * from CQDS003
update CQDS003 set CQSWFA='Y'
update CQDS003 set CQSPFA='Y'
update CQDS003 set CQSCFA=1
update CQDS003 set CQSADF=0.00
*/


/*
--select SUM(CQSNET) from CQDS003 where CQSCSN='8100053' and CQSRCT<>'O' --order by CQSETD
select 
--SUM(INSIAM+INSVAM)
SUM((INSIAM+INSVAM)-(5*(INSIAM+INSVAM))/100 ) as LASTPAYMENT
--,SUM(INSIAM+INSVAM)- SUM((INSIAM+INSVAM)-((INSIAM+INSVAM)*0.05))
from HPTINS00 where INSCRN='8100002' and INSITM<17 and INSITM<>0

--select * from CQDS003 where CQSCSN='8100053' and CQSRCT<>'O'
--select CONPER,* from HPMCON00 where CONRUN='8100053'

--select top 1 * from HPTINS00 where INSF11=3 and INSCRN='8100053'
--select * from HPTINS00 where INSCRN='8100002' and INSITM=17
*/
GO
/****** Object:  UserDefinedFunction [dbo].[fn_GetChqPayment]    Script Date: 05/09/2012 11:44:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--select * from fn_GetChqPayment('8100497','2012-03-03') 
--select * from fn_GetChqPayment ('8100497',DEFAULT)
drop function fn_GetChqPayment

CREATE FUNCTION [dbo].[fn_GetChqPayment] ( @CSN varchar(15),@DT datetime = null )
RETURNS @ChqPayment  TABLE
   (
   CQSCSN varchar(15),
   CQMDTE datetime,
   --CQMCNO varchar(7),   
   CQSADV decimal(18,2),
   INSCRN varchar(15),
   INSDUE datetime,
   INSITM int,
   INSIAM decimal(18,2),
   INSVAM decimal(18,2),
   INSIRA decimal(18,2),
   WHT decimal(18,2),
   INSNET decimal(18,2),
   LSTPAY decimal(18,2),   
   ACCUM decimal(18,2),
   OUTSTD decimal(18,2),      
   NETPAY decimal (18,2),
   PAYSTS int
   )
AS
BEGIN
-- version 1.0
declare   @CQSCSN varchar(15)
declare   @CQMDTE datetime
declare   @CQMCNO varchar(7)
declare   @CQSADV decimal(18,2)
declare   @INSCRN varchar(15)
declare   @INSDUE datetime
declare   @INSITM int
declare   @INSIAM decimal(18,2)
declare   @INSVAM decimal(18,2)
declare   @INSIRA decimal(18,2)
declare   @WHT decimal(18,2)
declare   @INSNET decimal(18,2)
declare   @LSTPAY decimal(18,2)
declare   @ACCUM decimal(18,2)
declare   @OUTSTD decimal(18,2)
declare   @NETPAY decimal (18,2)
declare	  @STAT int


--declare @CSN as varchar(15)
--decclare @DT as datetime
--set @CSN='8100053'--'8100053'
declare @CurrDate as datetime

if @DT is null
	set @CurrDate ={fn now()}
else 
	set @CurrDate =@DT

declare  c1 cursor for 
select 
rcv.*,ins.*,0 as ACCUM,0 as OUTSTD,0 as ADVDIFF
--###################################################
from
(   --# RECEIVE
	select aa.CQSCSN,bb.CQMDTE--,aa.CQSADV--,aa.CQMCNO
	,SUM(aa.CQSADV) as CQSADV
	from 
	(
		select 
			b.CQMDNO, b.CQMCNO,b.CQMCFA,a.CQSCSN,CQMDTE,a.CQSAMT,a.CQSVAT
			,a.CQSWHT,a.CQSNET,a.CQSRCT,a.CQSADF,a.CQSCFA,a.CQSWFA,a.CQSPFA
			,case 
			 when a.CQSWFA='Y' then 
				((a.CQSAMT+a.CQSVAT) - a.CQSWHT )				
			  else 
				a.CQSAMT+a.CQSVAT 
			 end
			 as CQSADV
		from CQDS003  a
		left join CQDM007 b on a.CQSDNO=b.CQMDNO
		where 
		a.CQSRCT='N'								-- 'O' = Other , 'N' = Normal
		--and b.CQMSTS='A'
		and b.CQMACT='A'
		and left(b.CQMDNO,1)<>'#' and left(b.CQMDNO,1)<>'*'
		and (b.CQMCFA<>'P'  or  b.CQMCFA is null)	-- 'P' = Chq. Pass status
		and (
				(year(b.CQMDTE)< YEAR(@CurrDate) )  
				or ((year(b.CQMDTE)= YEAR(@CurrDate) ) and (month(b.CQMDTE)<= month(@CurrDate) ))
			)				
		and a.CQSACT='A' and a.CQSCSN=@CSN
		and not exists (
			select CQMNO2 from CQDM011 c where CQMNO2=b.CQMCNO and c.CQMSTS='P'  --in ('P'=pass,'N'=payin,'A'=deposit,'Y'=return)   -- master chq. status pass
			and  (
				day(@CurrDate)>day(c.CQMSTD) and
				 YEAR(@CurrDate)=YEAR(c.CQMSTD) and MONTH(@CurrDate)=MONTH(c.CQMSTD)
				 )				  		
		)
		
	) aa
	left join (
			 select b.CQMDNO,b.CQMDTE,a.CQSCSN from CQDS003 a 
			 left join CQDM007 b on a.CQSDNO=b.CQMDNO
			  where  a.CQSCSN=@CSN
			  and left(b.CQMDNO,1)<>'#' and left(b.CQMDNO,1)<>'*'
				and  (
						(year(b.CQMDTE)< YEAR(@CurrDate) )  or 
						((year(b.CQMDTE)= YEAR(@CurrDate) ) and (month(b.CQMDTE)<= month(@CurrDate) ))
					)
										
			 group by a.CQSCSN,b.CQMDTE,b.CQMDNO
		) bb on aa.CQSCSN=bb.CQSCSN and aa.CQMDNO=bb.CQMDNO
	group by aa.CQSCSN,bb.CQMDTE--,aa.CQSADV--,aa.CQMCNO
) rcv

--###################################################
right join
(	--## INSTALLMENT
	select 
		a.INSCRN,a.INSDUE,a.INSITM,a.INSIAM,a.INSVAM,a.INSIRA,
		case 
		 when b.CONPER<=36 then ((5*a.INSIAM )/100)  --((5*(a.INSIAM + a.INSVAM))/100) 
		 else 0 
		 end WHT
		,
		case 
		 when b.CONPER<=36 then (a.INSIAM + a.INSVAM) - (5*(a.INSIAM))/100  
		else (a.INSIAM + a.INSVAM)
		end
		as INSNET
	,isnull((
		select 
			case 
			when c.CONPER<=36 then (SUM((b.INSIAM+b.INSVAM) - (5*(b.INSIAM))/100 ))
			else (SUM(b.INSIAM+b.INSVAM))		
			end
			as xx
		from HPTINS00 b 
		left join HPMCON00 c on b.INSCRN=c.CONRUN
		where b.INSCRN=@CSN 
		--and b.INSDUE<MIN(a.INSDUE)
		and  
		 (
			(year(b.INSDUE)< YEAR(MIN(a.INSDUE)) )  
			or ((year(b.INSDUE)= YEAR(MIN(a.INSDUE)) ) and (month(b.INSDUE)< month(MIN(a.INSDUE)) ))
			)		
		
		group by b.INSCRN,c.CONPER
	),0)as LSTPAY 
	 
		
	from HPTINS00 a
	left join HPMCON00 b on a.INSCRN=b.CONRUN
	where a.INSCRN=@CSN and a.INSF11=3		
	--and a.INSDUE<={fn NOW()}
	 and
	 (
		(year(a.INSDUE)< YEAR(@CurrDate) )  or 
		((year(a.INSDUE)= YEAR(@CurrDate) ) and (month(a.INSDUE)<= month(@CurrDate) ))
		)
	group by a.INSCRN,a.INSDUE,a.INSIAM,a.INSVAM,a.INSITM,a.INSVAM,a.INSVRA,a.INSIRA,b.CONPER
	--order by INSDUE
) ins on rcv.CQSCSN=ins.INSCRN and year(rcv.CQMDTE)=YEAR(ins.INSDUE) and MONTH(rcv.CQMDTE)=MONTH(ins.INSDUE)




declare @RAmount decimal(18,2)

	select @RAmount=
		isnull(
			case 
			when a.CQSWFA='Y' then 
				sum((a.CQSAMT+a.CQSVAT) - a.CQSWHT )		
			else 
				sum(a.CQSAMT+a.CQSVAT )
		 end
		 ,0)
	from CQDS003  a
	left join CQDM007 b on a.CQSDNO=b.CQMDNO
	where 
	--b.CQMSTS='A'
	b.CQMACT='A'	
	and a.CQSRCT='N'					   -- 'O' = Other , 'N' = Normal
	--and left(b.CQMDNO,1)<>'#' and left(b.CQMDNO,1)<>'*'
	and (b.CQMCFA<>'P'  or  b.CQMCFA is null)							   -- 'P' = Chq. Pass status
	and a.CQSACT='A'
	--and b.CQMDTE<=ins.INSDUE
	and  
	 (
		(year(b.CQMDTE)< YEAR(@CurrDate)  ) or  
		 ((year(b.CQMDTE)= YEAR(@CurrDate) ) and (month(b.CQMDTE)<= month(@CurrDate) ))
		)
		
		and not exists (
			select CQMNO2 from CQDM011 c where CQMNO2=b.CQMCNO and c.CQMSTS='P'   -- master chq. status pass
			and  (
				day(@CurrDate)>day(c.CQMSTD) and
				 YEAR(@CurrDate)=YEAR(c.CQMSTD) and MONTH(@CurrDate)=MONTH(c.CQMSTD)
				 )				  		
		)
							

	and a.CQSCSN=@CSN	
	group by CQSWFA

--##################

declare @ACM decimal(18,2)
declare @OUT decimal (18,2)
declare @count int
declare @RAmount2 decimal(18,2)
set @ACM=0
set @count=0
set @OUT=0.00
set @RAmount2=@RAmount
--##################

--select * from fn_GetChqPayment('8100001',DEFAULT)
open c1
fetch  next from c1 into @CQSCSN,@CQMDTE,@CQSADV,@INSCRN,@INSDUE,@INSITM,@INSIAM,@INSVAM,@INSIRA,@WHT,@INSNET,@LSTPAY,@ACCUM,@OUTSTD,@NETPAY
	while @@fetch_status=0 
	begin

		set @ACM= @ACM+@INSNET

		if @count>0  begin
			set @RAmount=isnull(@RAmount,0) - @INSNET	
			set @OUTSTD=isnull(@RAmount,0)
		end
		
		set @NETPAY=@INSNET
		
		if @OUTSTD<0
		set @NETPAY=abs(@OUTSTD)+@INSNET
		
		if @OUTSTD>0
		set @NETPAY=@INSNET-abs(@OUTSTD)
		
		if @NETPAY<0  set @NETPAY=0.00  -- 
		
		set @ACCUM=@ACM
		set @count=@count+1
		
		if @ACM<=@RAmount2
			set @STAT=0 else set @STAT=1
				
		insert into @ChqPayment	
		select 
		 @CQSCSN as CQSCSN 	,@CQMDTE as CQMDTE 	,@CQSADV as CQSADV 		,@INSCRN as INSCRN 		,@INSDUE as INSDUE
		,@INSITM as INSITM		,@INSIAM as INSIAM 		,@INSVAM as INSVAM 		,@INSIRA as INSIRA 		,@WHT as WHT
		,@INSNET as INSNET 		,@LSTPAY as LSTPAY		
		,@ACCUM as ACCUM,@OUTSTD as OUTSTD,@NETPAY as NETPAY,@STAT as STAT
		fetch  next from c1 into @CQSCSN,@CQMDTE,@CQSADV,@INSCRN,@INSDUE,@INSITM,@INSIAM,@INSVAM,@INSIRA,@WHT,@INSNET,@LSTPAY,@ACCUM,@OUTSTD,@NETPAY
	end
close c1
deallocate c1			



return
end
GO
/****** Object:  StoredProcedure [dbo].[SP_RESTORERECEIVE]    Script Date: 05/09/2012 11:44:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
--EXEC SP_RESTORERECEIVE
-- =============================================
drop procedure SP_RESTORERECEIVE

CREATE PROCEDURE [dbo].[SP_RESTORERECEIVE]									 
AS
BEGIN
	DECLARE @RFN VARCHAR(15)
  
	DECLARE CR1 CURSOR FOR
	SELECT CQMDNO FROM CQDM007 
	WHERE NOT EXISTS (SELECT CQMRFN FROM CQDM011 WHERE CQMRFN=CQMDNO) 
	  --AND LEFT(CQMDNO,1) <> '*'
	  --AND LEFT(CQMDNO,3) <> '300'
	OPEN CR1  
	FETCH NEXT FROM CR1 INTO @RFN
	WHILE @@FETCH_STATUS = 0  
	BEGIN  		
		UPDATE CQDM007 SET CQMDFG='I', CQMACC=NULL,CQMCTY=NULL WHERE CQMDNO=@RFN
	FETCH NEXT FROM CR1 INTO @RFN
	END	
	CLOSE CR1  
	DEALLOCATE CR1	
END
GO
/****** Object:  UserDefinedFunction [dbo].[fn_getInsPeriod]    Script Date: 05/09/2012 11:44:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--exec sp_getInsPeriod '8100002',26418.00
--exec sp_getInsPeriod '8100250',19795.00
drop function fn_getInsPeriod

CREATE function [dbo].[fn_getInsPeriod]  (
 @CON varchar(7) , -- CSN
 @CQAMT decimal(18,2)
 )
RETURNS @table  TABLE
   ( --a.INSCRN,a.INSILD,a.INSITM,a.INSDUE,a.INSIAM,a.INSVAM,
   INSCRN varchar(15),
   INSILD datetime,
   INSITM int,   
   INSDUE datetime,
   INSIAM decimal(18,2),
   INSVAM decimal(18,2),
   WHT decimal(18,2),
   NETAMT decimal(18,2),
   CONPER decimal(18,2)
   )
AS

begin

--declare @CON varchar(15)
--declare @CQAMT decimal(18,2)

--set @CON = '8100250'
--set @CQAMT=18500--19795
--set @CQAMT=19795.00--19795

declare @MaxDocNo varchar(15)
declare @ITMAMT decimal (18,2)
declare @ConPer int

declare @Taxrate decimal(18,0)


select @Taxrate=CQMVA1 from CQDM008 where CQMCDE='WHT_RATE'
select @ConPer=CONPER from HPMCON00 where CONRUN=@CON


declare @f1 int
select @f1=COUNT(*) from HPTINS00 where INSCRN=@CON  and INSF11=3 
select top 1 @ITMAMT=INSIAM from HPTINS00 where INSCRN=@CON  and INSF11=3 

--if @f1>0 
begin
	--declare @f2 int
	--select @f2=COUNT(*) from HPTINS00 where INSCRN=@CON  and INSF11=3 --and (INSIAM+INSIAM)=@CQAMT 
	--if @f2>0 
	--begin
	 -- 1:1
		insert into @table
		select * from (	
			select 
				a.INSCRN,a.INSILD,a.INSITM,a.INSDUE,a.INSIAM,a.INSVAM,
			--a.* ,
			case 
			when b.CONPER<36 then ((INSIAM*@Taxrate)/100) else 0
			end as WHT ,
			case when b.CONPER <36 then 
			((INSIAM+INSVAM)-((INSIAM*@Taxrate)/100)) 
			else (INSIAM+INSVAM)
			end
			as NETAMT ,b.CONPER
			from HPTINS00 a
			left join HPMCON00 b on a.INSCRN=b.CONRUN
			where INSCRN=@CON  and INSF11=3 --and INSIAM=@CQAMT
			and not exists (
				select * from CQDS003 where CQSCSN=@CON  and CQSRNO=a.INSITM
			)
			
			) a
			where a.NETAMT=@CQAMT
			order by a.INSILD,a.INSITM
			
			
	--end else
	--begin
		--select * from CQDS003 where CQSCSN='Z'
	--	select '' as INSCRN,NULL as INSILD,a.INSITM,a.INSDUE,a.INSIAM,a.INSVAM,
	--end 
end 
/*else
begin
	select * from CQDS003 where CQSCSN='Z'
end
*/

return

end
GO
/****** Object:  StoredProcedure [dbo].[sp_getInsPeriod]    Script Date: 05/09/2012 11:43:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--exec sp_getInsPeriod '8100053',36210
drop procedure sp_getInsPeriod

CREATE procedure [dbo].[sp_getInsPeriod] 
 @CON varchar(7) , -- CSN
 @CQAMT decimal(18,2)
as
begin

declare @MaxDocNo varchar(15)
declare @ITMAMT decimal (18,2)



declare @f1 int
select @f1=COUNT(*) from HPTINS00 where INSCRN=@CON  and INSF11=3 
select top 1 @ITMAMT=INSIAM from HPTINS00 where INSCRN=@CON  and INSF11=3 

if @f1>0 
begin
	declare @f2 int
	--select @f2=COUNT(*)  from HPTINS00 where INSCRN=@CON  and INSF11=3 and INSIAM=@CQAMT 
	
	select @ITMAMT=(
	case 
		when b.CONPER<36 then 
			a.INSIAM+a.INSVAM - (a.INSIAM*0.05)
		else 
			a.INSIAM+a.INSVAM
	end)
	from HPTINS00  a
	left join HPMCON00 b on a.INSCRN=b.CONRUN
	where INSCRN=@CON and INSF11=3 
	
	
	if @ITMAMT=@CQAMT 
	begin
	 -- 1:1
		select top 1
		case 
				when b.CONPER<36 then 
				(a.INSIAM*0.05)
		else 
			0
		end as WHT,
		case 
				when b.CONPER<36 then 
				(a.INSIAM+a.insvam)-(a.INSIAM*0.05)
		else 
			0
		end as NETAMT,

		a.* 
		from HPTINS00 a
		left join HPMCON00 b on a.INSCRN=b.CONRUN
			where INSCRN=@CON  and INSF11=3 --and INSIAM=@CQAMT
			and not exists (
				select * from CQDS003 where CQSCSN=@CON  and CQSRNO=a.INSITM
			)
			order by INSILD,INSITM
	end else
	begin
		select * from CQDS003 where CQSCSN='Z'
	end 
end else
begin
	select * from CQDS003 where CQSCSN='Z'
end

end
GO
/****** Object:  StoredProcedure [dbo].[sp_getPayRelatedDtl]    Script Date: 05/09/2012 11:43:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
exec sp_getPayRelated '8100043'
select * from HPTINS00

*/
-- drop procedure sp_getPayRelated 
drop procedure sp_getPayRelatedDtl

CREATE procedure [dbo].[sp_getPayRelatedDtl] 
 @ConNo varchar(10)  
as
begin


--declare @ConNo varchar(10)
declare @DocNo varchar(15)

--set @ConNo='8100043';
	 
	select 
		@DocNo=CQSDNO
	from CQDS003 a  where CQSCSN=@ConNo
	select * from CQDS003 where CQSDNO=@DocNo order by CQSRNO

end
GO
/****** Object:  StoredProcedure [dbo].[SP_PROCESSRESULT]    Script Date: 05/09/2012 11:44:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
drop procedure SP_PROCESSRESULT

CREATE PROCEDURE [dbo].[SP_PROCESSRESULT]
				@CHEQUEDATE			DATETIME,
				@CHEQUEAMOUNT		NUMERIC (18,2),
				@CHEQUENO			VARCHAR (10),
				@CHEQUEBNKCODE		VARCHAR (3),
				@CHEQUEBNKBRANCH	VARCHAR (4),
				@CHEQUESTATUS		CHAR (1),
				@CHEQUECTYPE		CHAR (1),
				@RESONCODE			CHAR (2),
				@CONT				VARCHAR (7),
				@COLNO				VARCHAR (14)			
AS
BEGIN
	DECLARE @ACT CHAR (1)
	DECLARE @STS CHAR (1)
	DECLARE @CTY CHAR (1)
	DECLARE @CST CHAR (2)
	DECLARE @ETY CHAR (3)
	DECLARE @RMK VARCHAR (20)
	DECLARE @RFN VARCHAR (15)
	DECLARE @CNO VARCHAR (14)
	
	--IF OBJECT_ID( 'TEMPDB..#RESULT' ) IS NOT NULL DROP TABLE #RESULT
	
	SELECT @ACT		  = CQMACT
		  ,@STS		  = CQMSTS
		  ,@CTY		  = CQMCTY
		  ,@RFN		  = CQMRFN
		  ,@CNO		  = CQMCNO
	FROM CQDM011
    WHERE CQMDAT=@CHEQUEDATE
    AND   CQMAMT=@CHEQUEAMOUNT
    AND   CQMNO2=@CHEQUENO
    AND   CQMBNK=@CHEQUEBNKCODE
    AND   CQMBBR=@CHEQUEBNKBRANCH
    AND	  CQMCNO=@COLNO
        
    IF @ACT = '' OR @ACT IS NULL
		BEGIN
			SET @ETY = 'ECF'
			SET @RMK = 'CHEQUE NOT FOUND'
		END
    ELSE
		BEGIN
			IF  @CHEQUESTATUS = 'N' AND @ACT = 'A' AND @STS = 'A'
			OR  @CHEQUESTATUS = 'P' AND @ACT = 'A' AND @STS = 'N'
			OR  @CHEQUESTATUS = 'P' AND @ACT = 'A' AND @STS = 'R'
			OR  @CHEQUESTATUS = 'Y' AND @ACT = 'A' AND @STS = 'N'
									AND @CHEQUECTYPE = @CTY
									AND @RESONCODE <> '99'
				BEGIN
					SET @ETY = 'E  '
					SET @RMK = ''
					IF @CONT = '' SET @CONT = (SELECT TOP 1 CQSDLC FROM CQDS001 WHERE CQSCNO=@CNO)
				END
			ELSE
				BEGIN
					SET @ETY = 'EFI'
					SET @RMK = 'FORMAT INVALID'					
				END			
		END
	SET @CST = ISNULL(@ACT,'') + ISNULL(@STS,'') 
	SELECT @ETY AS ETY,@RMK AS RMK,@CST AS CST,@RFN AS RFN,@CONT AS CON
END
GO
/****** Object:  StoredProcedure [dbo].[SP_LS_GEN_HPMRCV00]    Script Date: 05/09/2012 11:43:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
drop procedure SP_LS_GEN_HPMRCV00

CREATE PROCEDURE [dbo].[SP_LS_GEN_HPMRCV00]
(
@PRM_RCDBRN varchar(2),
@PRM_RCDPDM varchar(1),
@PRM_RCDPDT varchar(2),
@PRM_RCDDOC varchar(12),
@PRM_ASDATE datetime 
)
AS
BEGIN
Declare @HPMRCV00_TMP TABLE (
	RCVACT varchar(1),
	RCVPST varchar(1),
	RCVPSD datetime,
	RCVPTS varchar(1),
	RCVUPS varchar(1),
	RCVPTD datetime,
	RCVBRN varchar(2),
	RCVPDM varchar(1),
	RCVPDT varchar(2),
	RCVDOC varchar(12),
	RCVITM varchar(2),
	RCVCBR varchar(2),
	RCVCRN varchar(7),
	RCVRTY varchar(3),
	RCVAMT numeric(11, 2),
	RCVRFR int,
	RCVRTO int,
	RCVDTE datetime,
	RCVRBY nvarchar(1),
	RCVBCD varchar(2),
	RCVBBN varchar(3),
	RCVCQN varchar(15),
	RCVCQD datetime,
	RCVPAN varchar(15),
	RCVPNM varchar(50),
	RCVCQT varchar(1),
	RCVTRC varchar(12),
	RCVRCN varchar(15),
	RCVETD datetime,
	RCVETM datetime,
	RCVUET varchar(10),
	RCVMTD datetime,
	RCVMTM datetime,
	RCVUTM varchar(10),
	RCVCLC varchar(7),
	RCVPAT int,
	RCVCHQ varchar(7),
	RCVTCD varchar(3),
	RCVCBY varchar(1),
	RCVRPF varchar(1),
	RCVICA numeric(11, 2),
	RCVLPD datetime,
	RCVSEQ varchar(2),
	RCVGRC varchar(7),
	RCVCQS varchar(1),
	RCVVDT datetime,
	RCVGLP varchar(1),
	RCVF01 varchar(1),
	RCVF02 varchar(1),
	RCVF03 varchar(1),
	RCVF04 varchar(1),
	RCVF05 varchar(1),
	RCVF06 varchar(1),
	RCVF07 varchar(1),
	RCVF08 varchar(1),
	RCVF09 varchar(1),
	RCVF10 varchar(1),
	RCVAM1 numeric(11, 2),
	RCVAM2 numeric(11, 2),
	RCVAM3 numeric(11, 2),
	RCVDT1 datetime,
	RCVDT2 datetime,
	RCVDT3 datetime
)
declare @RCDACT varchar(1)
declare @RCDPST varchar(1)
declare @RCDPSD datetime
declare @RCDFL1 varchar(1)
declare @RCDFL2 varchar(1)
declare @RCDFL3 varchar(1)
declare @RCDBRN varchar(2)
declare @RCDPDM varchar(1)
declare @RCDPDT varchar(2)
declare @RCDDOC varchar(12)
declare @RCDITM varchar(2)
declare @RCDSEQ varchar(2)
declare @RCDCBN varchar(2)
declare @RCDCPM varchar(1)
declare @RCDCPT varchar(2)
declare @RCDCRN varchar(7)
declare @RCDRTY varchar(3)
declare @RCDAMT numeric(11,2)
declare @RCDRFR int
declare @RCDRTO int
declare @RCDETD datetime
declare @RCDETM datetime
declare @RCDUET varchar(10)
declare @RCDMTD datetime
declare @RCDMTM datetime
declare @RCDUTM varchar(10)
declare @RCDREF varchar(15)
declare @RCDICA numeric(11,2)

declare @RCHRBY varchar(1)
declare @RCHBBN varchar(2)
declare @RCHBBR varchar(3)
declare @RCHRFN varchar(15)
declare @RCHRFD datetime
declare @RCHAMT numeric(11,2)
declare @RCHACN varchar(15)
declare @RCHCQP varchar(50)
declare @RCHCQT varchar(1)
declare @RCBCLC varchar(7)
declare @RCBDDT datetime
declare @CONCAC varchar(10)
declare @CONCUS varchar(7)
declare @CONSTS varchar(2)
declare @ADFR07 varchar(1)

declare @ARRAY_AMT11 numeric(11,2);
declare @ARRAY_AMT12 numeric(11,2);
declare @ARRAY_AMT13 numeric(11,2);
declare @ARRAY_AMT14 numeric(11,2);
declare @ARRAY_AMT15 numeric(11,2);
declare @ARRAY_AMT16 numeric(11,2);
declare @ARRAY_AMT17 numeric(11,2);
declare @ARRAY_AMT18 numeric(11,2);
declare @ARRAY_AMT19 numeric(11,2);
declare @ARRAY_AMT20 numeric(11,2);
declare @ARRAY_AMT21 numeric(11,2);
declare @ARRAY_DTE21 datetime;
declare @ARRAY_DTE22 datetime;
declare @ARRAY_DTE23 datetime;
declare @ARRAY_DTE24 datetime;
declare @ARRAY_DTE25 datetime;
declare @ARRAY_DTE26 datetime;
declare @ARRAY_DTE27 datetime;
declare @ARRAY_DTE28 datetime;
declare @ARRAY_DTE29 datetime;
declare @ARRAY_DTE30 datetime;

declare @NET_AMT numeric(11,2);
declare @VAT_AMT numeric(11,2);

declare CUR_HPTRCD cursor for 
SELECT    
  RCDACT, RCDPST, RCDPSD, RCDFL1, RCDFL2, RCDFL3, RCDBRN, RCDPDM, RCDPDT
, RCDDOC, RCDITM, RCDSEQ, RCDCBN, RCDCPM, RCDCPT, RCDCRN, RCDRTY, RCDAMT
, RCDRFR, RCDRTO, RCDETD, RCDETM, RCDUET, RCDMTD, RCDMTM, RCDUTM, RCDREF
, RCDICA, RCBDDT, RCBCLC, RCHRBY, RCHBBN, RCHBBR, RCHRFN, RCHRFD, RCHAMT
, RCHACN, RCHCQP, RCHCQT, CONCAC, CONCUS, CONSTS, ADFR07
FROM [dbo].[HPTRCD00] D
INNER JOIN [HPTRCH00] H
 ON(D.RCDBRN = H.RCHBRN)
AND(D.RCDPDM = H.RCHPDM)
AND(D.RCDPDT = H.RCHPDT)
AND(D.RCDDOC = H.RCHDOC)
INNER JOIN [dbo].[HPTRCB00] B
 ON(D.RCDBRN = B.RCBBRN)
AND(D.RCDPDM = B.RCBPDM)
AND(D.RCDPDT = B.RCBPDT)
AND(D.RCDDOC = B.RCBDOC)
INNER JOIN [dbo].[HPMCON00] C
 ON(D.RCDCBN = C.CONBRN)
AND(D.RCDCPM = C.CONPDM)
AND(D.RCDCPT = C.CONPDT)
AND(D.RCDCRN = C.CONRUN)
LEFT JOIN [dbo].[HPMADF00] A
 ON(D.RCDCPM = A.ADFPDM)
AND(D.RCDCPT = A.ADFPDT)
AND(D.RCDRTY = A.ADFRTY)
WHERE D.RCDBRN = @PRM_RCDBRN
AND D.RCDPDM = @PRM_RCDPDM
AND D.RCDPDT = @PRM_RCDPDT
AND D.RCDDOC = @PRM_RCDDOC
AND B.RCBPST = '2'
ORDER BY 
D.RCDDOC, D.RCDITM, D.RCDSEQ
;
set @ARRAY_AMT11 = 0;
set @ARRAY_AMT12 = 0;
set @ARRAY_AMT13 = 0;
set @ARRAY_AMT14 = 0;
set @ARRAY_AMT15 = 0;
set @ARRAY_AMT16 = 0;
set @ARRAY_AMT17 = 0;
set @ARRAY_AMT18 = 0;
set @ARRAY_AMT19 = 0;
set @ARRAY_AMT20 = 0;
set @ARRAY_AMT21 = 0;
set @ARRAY_DTE21 = @PRM_ASDATE;
set @ARRAY_DTE22 = @PRM_ASDATE;
set @ARRAY_DTE23 = @PRM_ASDATE;
set @ARRAY_DTE24 = @PRM_ASDATE;
set @ARRAY_DTE25 = @PRM_ASDATE;
set @ARRAY_DTE26 = @PRM_ASDATE;
set @ARRAY_DTE27 = NULL;
set @ARRAY_DTE28 = NULL;
set @ARRAY_DTE29 = NULL;
set @ARRAY_DTE30 = NULL;

open CUR_HPTRCD;
fetch next from CUR_HPTRCD
into 
  @RCDACT, @RCDPST, @RCDPSD, @RCDFL1, @RCDFL2, @RCDFL3, @RCDBRN, @RCDPDM, @RCDPDT
, @RCDDOC, @RCDITM, @RCDSEQ, @RCDCBN, @RCDCPM, @RCDCPT, @RCDCRN, @RCDRTY, @RCDAMT
, @RCDRFR, @RCDRTO, @RCDETD, @RCDETM, @RCDUET, @RCDMTD, @RCDMTM, @RCDUTM, @RCDREF
, @RCDICA, @RCBDDT, @RCBCLC, @RCHRBY, @RCHBBN, @RCHBBR, @RCHRFN, @RCHRFD, @RCHAMT
, @RCHACN, @RCHCQP, @RCHCQT, @CONCAC, @CONCUS, @CONSTS, @ADFR07
;
while (@@fetch_status = 0)
begin	
	Set @VAT_AMT = (@RCDAMT * 7.00)/107.00;
	Set @NET_AMT = (@RCDAMT - @VAT_AMT);
	set @ARRAY_AMT11 = 0;
	set @ARRAY_AMT12 = 0;
	set @ARRAY_AMT13 = @VAT_AMT;
	set @ARRAY_AMT14 = @NET_AMT;
	set @ARRAY_AMT15 = 0;
	set @ARRAY_AMT16 = @ARRAY_AMT11 + @ARRAY_AMT13;
	set @ARRAY_AMT17 = @ARRAY_AMT12 + @ARRAY_AMT14;
	set @ARRAY_AMT18 = @ARRAY_AMT13 + @ARRAY_AMT14;
	set @ARRAY_AMT19 = 0;
	set @ARRAY_AMT20 = 0;
	set @ARRAY_AMT21 = @RCDAMT;

	set @ARRAY_DTE21 = @PRM_ASDATE;
	set @ARRAY_DTE22 = @RCBDDT;
	set @ARRAY_DTE23 = @RCHRFD;
	set @ARRAY_DTE24 = @PRM_ASDATE;
	set @ARRAY_DTE25 = @PRM_ASDATE;
	set @ARRAY_DTE26 = @PRM_ASDATE;
/*
    if (@ADFR07 = '2') 
      begin       
      end 
    ELSE
      begin
      end -- if (@ADFR07 = '2') 
---
[dbo].[FN_LS_GET_DTE_VAL](RPDDT1, NULL, 
	@ARRAY_DTE21, @ARRAY_DTE22, @ARRAY_DTE23, @ARRAY_DTE24, @ARRAY_DTE25, 
	@ARRAY_DTE26, @ARRAY_DTE27, @ARRAY_DTE28, @ARRAY_DTE29, @ARRAY_DTE30) AS dddd
[dbo].[FN_LS_GET_NUM_VAL](RPDAM1, @RCDAMT, 
	@ARRAY_AMT11, @ARRAY_AMT12, @ARRAY_AMT13, @ARRAY_AMT14, @ARRAY_AMT15,
	@ARRAY_AMT16, @ARRAY_AMT17, @ARRAY_AMT18, @ARRAY_AMT19, @ARRAY_AMT20) AS aaa
---
*/
INSERT INTO @HPMRCV00_TMP
SELECT 
  'A' AS RCVACT --, varchar(1),>
, '1' AS RCVPST --, varchar(1),>
, [dbo].[FN_LS_GET_DTE_VAL](RPDDT1, NULL, 
		@ARRAY_DTE21, @ARRAY_DTE22, @ARRAY_DTE23, @ARRAY_DTE24, @ARRAY_DTE25, 
		@ARRAY_DTE26, @ARRAY_DTE27, @ARRAY_DTE28, @ARRAY_DTE29, @ARRAY_DTE30)	AS RCVPSD --, datetime,>	
, RCVPTS AS RCVPTS --, varchar(1),>
, RCVUPS AS RCVUPS --, varchar(1),>
, [dbo].[FN_LS_GET_DTE_VAL](RPDDT2, NULL, 
		@ARRAY_DTE21, @ARRAY_DTE22, @ARRAY_DTE23, @ARRAY_DTE24, @ARRAY_DTE25, 
		@ARRAY_DTE26, @ARRAY_DTE27, @ARRAY_DTE28, @ARRAY_DTE29, @ARRAY_DTE30)	AS RCVPTD --, datetime,>	
, @RCDBRN AS RCVBRN --, varchar(2),>
, @RCDPDM AS RCVPDM --, varchar(1),>
, @RCDPDT AS RCVPDT --, varchar(2),>
, @RCDDOC AS RCVDOC --, varchar(12),>
, @RCDITM AS RCVITM --, varchar(2),>
, @RCDCBN AS RCVCBR --, varchar(2),>
, @RCDCRN AS RCVCRN --, varchar(7),>
, case
	when (RCVRTY = 'XXX') then @RCDRTY
	else  RCVRTY
  end AS RCVRTY --, varchar(3),> 
, [dbo].[FN_LS_GET_NUM_VAL](RPDAM1, @RCDAMT, 
		@ARRAY_AMT11, @ARRAY_AMT12, @ARRAY_AMT13, @ARRAY_AMT14, @ARRAY_AMT15,
		@ARRAY_AMT16, @ARRAY_AMT17, @ARRAY_AMT18, @ARRAY_AMT19, @ARRAY_AMT20)	AS RCVAMT --, numeric(11,2),>	
, @RCDRFR AS RCVRFR --, int,>
, @RCDRTO AS RCVRTO --, int,>
, [dbo].[FN_LS_GET_DTE_VAL](RPDDT3, NULL, 
		@ARRAY_DTE21, @ARRAY_DTE22, @ARRAY_DTE23, @ARRAY_DTE24, @ARRAY_DTE25, 
		@ARRAY_DTE26, @ARRAY_DTE27, @ARRAY_DTE28, @ARRAY_DTE29, @ARRAY_DTE30)	AS RCVDTE --, datetime,>	
, @RCHRBY AS RCVRBY --, nvarchar(1),>
, @RCHBBN AS RCVBCD --, varchar(2),>
, @RCHBBR AS RCVBBN --, varchar(3),>
, @RCHRFN AS RCVCQN --, varchar(15),>
, [dbo].[FN_LS_GET_DTE_VAL](RPDDT4, NULL, 
		@ARRAY_DTE21, @ARRAY_DTE22, @ARRAY_DTE23, @ARRAY_DTE24, @ARRAY_DTE25, 
		@ARRAY_DTE26, @ARRAY_DTE27, @ARRAY_DTE28, @ARRAY_DTE29, @ARRAY_DTE30)	AS RCVCQD --, datetime,>
, '' AS RCVPAN --, varchar(15),>
, '' AS RCVPNM --, varchar(50),>
, '' AS RCVCQT --, varchar(1),>
, '201' AS RCVTRC --, varchar(12),>
, '' AS RCVRCN --, varchar(15),>
, GETDATE() AS RCVETD --, datetime,>
, GETDATE() AS RCVETM --, datetime,>
, '' AS RCVUET --, varchar(10),>
, NULL AS RCVMTD --, datetime,>
, NULL AS RCVMTM --, datetime,>
, '' AS RCVUTM --, varchar(10),>
, @RCBCLC AS RCVCLC --, varchar(7),>
, coalesce(Right(@RCHACN,2),0)  AS RCVPAT --, int,>
, '' AS RCVCHQ --, varchar(7),>
, '330' AS RCVTCD --, varchar(3),>
, RCVCBY AS RCVCBY --, varchar(1),>
, '2' AS RCVRPF --, varchar(1),>
, [dbo].[FN_LS_GET_NUM_VAL](RPDAM2, @RCDAMT, 
		@ARRAY_AMT11, @ARRAY_AMT12, @ARRAY_AMT13, @ARRAY_AMT14, @ARRAY_AMT15,
		@ARRAY_AMT16, @ARRAY_AMT17, @ARRAY_AMT18, @ARRAY_AMT19, @ARRAY_AMT20)	AS RCVICA --, numeric(11,2),>
, [dbo].[FN_LS_GET_DTE_VAL](RPDDT5, NULL, 
		@ARRAY_DTE21, @ARRAY_DTE22, @ARRAY_DTE23, @ARRAY_DTE24, @ARRAY_DTE25, 
		@ARRAY_DTE26, @ARRAY_DTE27, @ARRAY_DTE28, @ARRAY_DTE29, @ARRAY_DTE30)	AS RCVLPD --, datetime,>	
, '' AS RCVSEQ --, varchar(2),>
, Right('0000000' +@CONCUS, 7) AS RCVGRC --, varchar(7),>
, RCVCQS AS RCVCQS --, varchar(1),>
, [dbo].[FN_LS_GET_DTE_VAL](RPDDT6, NULL, 
		@ARRAY_DTE21, @ARRAY_DTE22, @ARRAY_DTE23, @ARRAY_DTE24, @ARRAY_DTE25, 
		@ARRAY_DTE26, @ARRAY_DTE27, @ARRAY_DTE28, @ARRAY_DTE29, @ARRAY_DTE30)	AS RCVVDT --, datetime,>	
, RCVGLP AS RCVGLP --, varchar(1),>

, '' AS RCVF01 --, varchar(1),>
, '' AS RCVF02 --, varchar(1),>
, '' AS RCVF03 --, varchar(1),>

, '1' AS RCVF04 --, varchar(1),>
, '2' AS RCVF05 --, varchar(1),>
, '' AS RCVF06 --, varchar(1),>
, 'C' AS RCVF07 --, varchar(1),>
, '' AS RCVF08 --, varchar(1),>
, '' AS RCVF09 --, varchar(1),>
, '' AS RCVF10 --, varchar(1),>
, [dbo].[FN_LS_GET_NUM_VAL](RPDAM3, @RCDAMT, 
		@ARRAY_AMT11, @ARRAY_AMT12, @ARRAY_AMT13, @ARRAY_AMT14, @ARRAY_AMT15,
		@ARRAY_AMT16, @ARRAY_AMT17, @ARRAY_AMT18, @ARRAY_AMT19, @ARRAY_AMT20)	AS RCVAM1 --, numeric(11,2),>
, [dbo].[FN_LS_GET_NUM_VAL](RPDAM4, @RCDAMT, 
		@ARRAY_AMT11, @ARRAY_AMT12, @ARRAY_AMT13, @ARRAY_AMT14, @ARRAY_AMT15,
		@ARRAY_AMT16, @ARRAY_AMT17, @ARRAY_AMT18, @ARRAY_AMT19, @ARRAY_AMT20)	AS RCVAM2 --, numeric(11,2),>
, [dbo].[FN_LS_GET_NUM_VAL](RPDAM5, @RCDAMT, 
		@ARRAY_AMT11, @ARRAY_AMT12, @ARRAY_AMT13, @ARRAY_AMT14, @ARRAY_AMT15,
		@ARRAY_AMT16, @ARRAY_AMT17, @ARRAY_AMT18, @ARRAY_AMT19, @ARRAY_AMT20)	AS RCVAM3 --, numeric(11,2),>
, [dbo].[FN_LS_GET_DTE_VAL](RPDDT7, NULL, 
		@ARRAY_DTE21, @ARRAY_DTE22, @ARRAY_DTE23, @ARRAY_DTE24, @ARRAY_DTE25, 
		@ARRAY_DTE26, @ARRAY_DTE27, @ARRAY_DTE28, @ARRAY_DTE29, @ARRAY_DTE30)	AS RCVDT1 --, datetime,>	
, [dbo].[FN_LS_GET_DTE_VAL](RPDDT8, NULL, 
		@ARRAY_DTE21, @ARRAY_DTE22, @ARRAY_DTE23, @ARRAY_DTE24, @ARRAY_DTE25, 
		@ARRAY_DTE26, @ARRAY_DTE27, @ARRAY_DTE28, @ARRAY_DTE29, @ARRAY_DTE30)	AS RCVDT2 --, datetime,>	
, [dbo].[FN_LS_GET_DTE_VAL](RPDDT9, NULL, 
		@ARRAY_DTE21, @ARRAY_DTE22, @ARRAY_DTE23, @ARRAY_DTE24, @ARRAY_DTE25, 
		@ARRAY_DTE26, @ARRAY_DTE27, @ARRAY_DTE28, @ARRAY_DTE29, @ARRAY_DTE30)	AS RCVDT3 --, datetime,>)
FROM FN_LS_GET_RPH_RPD('L','N','N','2',@RCDRTY);

fetch next from CUR_HPTRCD
into 
  @RCDACT, @RCDPST, @RCDPSD, @RCDFL1, @RCDFL2, @RCDFL3, @RCDBRN, @RCDPDM, @RCDPDT
, @RCDDOC, @RCDITM, @RCDSEQ, @RCDCBN, @RCDCPM, @RCDCPT, @RCDCRN, @RCDRTY, @RCDAMT
, @RCDRFR, @RCDRTO, @RCDETD, @RCDETM, @RCDUET, @RCDMTD, @RCDMTM, @RCDUTM, @RCDREF
, @RCDICA, @RCBDDT, @RCBCLC, @RCHRBY, @RCHBBN, @RCHBBR, @RCHRFN, @RCHRFD, @RCHAMT
, @RCHACN, @RCHCQP, @RCHCQT, @CONCAC, @CONCUS, @CONSTS, @ADFR07
;
end  --while (@@fetch_status = 0)
close CUR_HPTRCD;
deallocate CUR_HPTRCD;

--UPDATE [HPMRCV00_TMP]  For Update CONSTS And Closing Normal '91'
--SELECT * FROM @HPMRCV00_TMP
UPDATE	@HPMRCV00_TMP	SET		RCVF01 = '1', 	RCVF02 = '9', 	RCVF03 = '1'	
	WHERE	RCVAMT > 0 AND RCVRTY = 'P12';

--INSERT [HPMRCV00]
INSERT INTO [dbo].[HPMRCV00] 
  SELECT * FROM @HPMRCV00_TMP WHERE RCVAMT > 0;


--UPDATE [dbo].[HPTRCB00]
UPDATE [dbo].[HPTRCB00] SET
	RCBPST = '0', 
	RCBPSD = GETDATE()
WHERE RCBBRN = @PRM_RCDBRN
and RCBPDM = @PRM_RCDPDM
and RCBPDT = @PRM_RCDPDT
and RCBDOC = @PRM_RCDDOC;

-- for test store procedure
--select * from @HPMRCV00_TMP where rcvamt > 0;
--return
END
GO
/****** Object:  UserDefinedFunction [dbo].[FN_CalcuGoods]    Script Date: 05/09/2012 11:44:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--SELECT * FROM FN_CALCUGOODS (14900,'8100415')
--SELECT * FROM FN_CALCUGOODS (14816.82,'8100593')
drop procedure FN_CalcuGoods

CREATE FUNCTION [dbo].[FN_CalcuGoods]
(	
	@GOODS DECIMAL (18,2),
	@CONTRACT VARCHAR (8)
)
RETURNS TABLE 
AS
RETURN 
	SELECT @GOODS AS GOODS
	      ,(@GOODS * (SELECT CQMVA1  
					  FROM CQDM008 
					  WHERE CQMABR='PREFERENCE' 
					    AND CQMGRP='PREFERENCE'
					    AND CQMCDE='VAT_RATE')
			)/100 AS VAT
	      ,((
	       @GOODS * (SELECT TOP 1 CASE WHEN CONPER <= 36 THEN 
								(SELECT CQMVA1  
								 FROM CQDM008 
								 WHERE CQMABR='PREFERENCE' 
								   AND CQMGRP='PREFERENCE'
								   AND CQMCDE='WHT_RATE')
						   ELSE
								0
						   END
					 FROM HPMCON00 WHERE CONRUN=@CONTRACT) 	
	        )/100) AS WHT
	       ,(@GOODS + (
	       (
			@GOODS * (SELECT CQMVA1 FROM CQDM008 WHERE CQMABR='PREFERENCE' AND CQMGRP='PREFERENCE' AND CQMCDE='VAT_RATE')
		   )/100
		   ) - (
		   (
			@GOODS * (SELECT TOP 1 
			                  CASE WHEN CONPER <= 36 THEN 
									(SELECT CQMVA1  
									 FROM CQDM008 
									 WHERE CQMABR='PREFERENCE' 
									   AND CQMGRP='PREFERENCE'
									   AND CQMCDE='WHT_RATE')
							   ELSE
									0
							   END
					   FROM HPMCON00 WHERE CONRUN=@CONTRACT) 	
	        )/100
	        )
	        ) AS NET
GO
/****** Object:  StoredProcedure [dbo].[zz_sp_update_receive]    Script Date: 05/09/2012 11:44:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
drop procedure zz_sp_update_receive

CREATE PROCEDURE [dbo].[zz_sp_update_receive](
	@Prm_Date datetime,
	@Prm_Cont# VARCHAR(7),
	@Prm_Good float,
	@Prm_Vat float,
	@Prm_Total float
)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    declare        @INSACT VARCHAR(1);
    declare        @INSF11 varchar(1);
    declare        @INSF12 varchar(1);
    declare        @INSF21 varchar(1);
    declare        @INSF22 varchar(1);
    declare        @INSILD datetime;
	declare 	   @INSVLD datetime;
    declare        @INSCBR varchar(2);
    declare        @INSCPM varchar(1);
    declare        @INSCPT varchar(2);
    declare        @INSCRN varchar(7);
    declare        @INSITM int;
    declare        @INSDUE datetime;
    declare        @INSIAM numeric(11,2);
    declare        @INSIRA numeric(11,2);
    declare        @INSVAM numeric(11,2);
    declare        @INSVPA numeric(11,2);
    declare        @INSVRA numeric(11,2);

    declare        @BAL_AMT numeric(11,2);
	declare        @RCV_AMT numeric(11,2);
	declare        @BAL_VAT numeric(11,2);
	declare        @RCV_VAT numeric(11,2);
	declare		   @CONIRD int;
	declare		   @CONVRD int;
    declare		   @CONLPD datetime;
		
    -- Insert statements for procedure here
	declare @Mytb table(
           xINSACT varchar(1),
           xINSF11 varchar(1),
           xINSF12 varchar(1),
           xINSF21 varchar(1),
           xINSF22 varchar(1),
           xINSILD datetime,           
		   xINSVLD datetime,
           xINSCBR varchar(2),
           xINSCPM varchar(1),
           xINSCPT varchar(2),
           xINSCRN varchar(7),
           xINSITM int,
           xINSDUE datetime,
           xINSIAM numeric(11,2),
           xINSIRA numeric(11,2),
           xINSVAM numeric(11,2),
           xINSVPA numeric(11,2),
           xINSVRA numeric(11,2),
			xRCV_AMT numeric(11,2),
			xRCV_VAT numeric(11,2))

  DECLARE CUR_HPTINS CURSOR FOR 
    select	INSACT,INSF11,INSF12,INSF21,INSF22,INSILD,INSVLD,
			INSCBR,INSCPM,INSCPT,INSCRN,INSITM,INSDUE,
			INSIAM,INSIRA,INSVAM,INSVPA,INSVRA
    from hptins07
    where INSCBR = '01'
	and INSCPM = '2'
	and INSCPT = '01'
	and INSCRN = @Prm_Cont#
    ORDER BY INSITM;

  set @RCV_AMT = @Prm_Good;
  set @RCV_VAT = @Prm_Vat;

  open CUR_HPTINS;
  fetch next from CUR_HPTINS
   into @INSACT,@INSF11,@INSF12,@INSF21,@INSF22,@INSILD,@INSVLD,
		@INSCBR,@INSCPM,@INSCPT,@INSCRN,@INSITM,@INSDUE,
		@INSIAM,@INSIRA,@INSVAM,@INSVPA,@INSVRA;

  while ((@@fetch_status = 0) and ((@RCV_AMT > 0) or (@RCV_VAT > 0)) )
  begin		
    set @BAL_AMT = (@INSIAM - @INSIRA)
	if (@RCV_AMT > 0) 
	begin
		if (@RCV_AMT >= @BAL_AMT) 
	    begin
			set @CONIRD  = @INSITM
			set @CONLPD  = @Prm_Date
			set @INSF11  = '0'
			set @INSF12	 = '0'
			set @INSILD  = @Prm_Date 
			set @INSIRA  = @INSIRA + @BAL_AMT
			set @RCV_AMT = @RCV_AMT - @BAL_AMT		
		end else
		begin
			set @CONLPD  = @Prm_Date
			set @INSF11  = '1'
			set @INSF12	 = '1'
			set @INSILD  = @Prm_Date 
			set @INSIRA  = @INSIRA + @RCV_AMT
			set @RCV_AMT = 0
		end
	end

    set @BAL_VAT = (@INSVAM - @INSVRA)
	if (@RCV_VAT > 0) 
	begin
		if (@RCV_VAT >= @BAL_VAT) 
		begin
			set @CONVRD  = @INSITM
			set @CONLPD  = @Prm_Date
			set @INSF21  = '0'
			set @INSF22	 = '0'
			set @INSVLD  = @Prm_Date 
			set @INSVRA  = @INSVRA + @BAL_VAT
			set @INSVPA  = @INSVRA
			set @RCV_VAT = @RCV_VAT - @BAL_VAT		
		end else
		begin
			set @CONLPD  = @Prm_Date
			set @INSF21  = '1'
			set @INSF22	 = '1'
			set @INSVLD  = @Prm_Date 
			set @INSVRA  = @INSVRA + @RCV_VAT
			set @INSVPA  = @INSVRA
			set @RCV_VAT = 0        
		end
	end

	insert into @Mytb 
    VALUES(@INSACT,@INSF11,@INSF12,@INSF21,@INSF22,@INSILD,@INSVLD,
		@INSCBR,@INSCPM,@INSCPT,@INSCRN,@INSITM,@INSDUE,
		@INSIAM,@INSIRA,@INSVAM,@INSVPA,@INSVRA,@RCV_AMT,@RCV_VAT);

    fetch next from CUR_HPTINS
     into @INSACT,@INSF11,@INSF12,@INSF21,@INSF22,@INSILD,@INSVLD,
	      @INSCBR,@INSCPM,@INSCPT,@INSCRN,@INSITM,@INSDUE,
	      @INSIAM,@INSIRA,@INSVAM,@INSVPA,@INSVRA;
  END;
  close CUR_HPTINS;
  deallocate CUR_HPTINS;
/*
    if  (@RCV_AMT <> 0)or(@RCV_VAT <> 0)
    begin
		Receive Over Amount;
	end
*/

  update dbo.hptins00 
	 set   INSF11 = B.xINSF11,
           INSF12 = B.xINSF12,
           INSF21 = B.xINSF21,
           INSF22 = B.xINSF22,
           INSILD = B.xINSILD, 
		   INSVLD = B.xINSVLD,
           INSIRA = B.xINSIRA,
           INSVPA = B.xINSVPA,
           INSVRA = B.xINSVRA 
    from @MYTB B
   where   INSCBR = B.xINSCBR
     and   INSCPM = B.xINSCPM
     and   INSCPT = B.xINSCPT
     and   INSCRN = B.xINSCRN
     and   INSITM = B.xINSITM;

  update dbo.hpmcon00 
	 set   CONIRD = B.xINSITM, 
		   CONVRD = B.xINSITM,
           CONLPD = B.xINSILD
    from (SELECT xINSCBR, xINSCPM, xINSCPT, xINSCRN, max(xINSITM) as xINSITM, max(xINSILD) as xINSILD 
			FROM @MYTB 
	    	WHERE xINSF12='0' AND xINSF22='0' AND xINSIAM=xINSIRA AND xINSVAM=xINSVRA 
			GROUP BY xINSCBR, xINSCPM, xINSCPT, xINSCRN) B
   where   CONBRN = B.xINSCBR
     and   CONPDM = B.xINSCPM
     and   CONPDT = B.xINSCPT
     and   CONRUN = B.xINSCRN;

  --SELECT * FROM @MYTB;
  --RETURN 
END
GO
/****** Object:  StoredProcedure [dbo].[SP_LS_UPD_CONSTS]    Script Date: 05/09/2012 11:44:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
drop procedure SP_LS_UPD_CONSTS

CREATE PROCEDURE [dbo].[SP_LS_UPD_CONSTS](
@PRM_RCVBRN		varchar(2)
,@PRM_RCVPDM	varchar(1)
,@PRM_RCVPDT	varchar(2)
,@PRM_RCVDOC	varchar(12)
,@PRM_RCVITM	varchar(2)
,@PRM_RCVCBR	varchar(2)
,@PRM_RCVCRN	varchar(7)
,@PRM_RCVRTY	varchar(3)
)
AS
BEGIN

	declare  @CONSTS Varchar(2)

	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	-- SELECT <@Param1, sysname, @p1>, <@Param2, sysname, @p2>

	IF  EXISTS (SELECT TOP 1 * --@CONSTS = CONSTS 
		FROM	[dbo].[HPMCON00]
		WHERE	CONBRN	=	@PRM_RCVBRN
		AND		CONPDM	=	@PRM_RCVPDM
		AND		CONPDT	=	@PRM_RCVPDT
		AND		CONRUN	=	@PRM_RCVCRN
	)
	begin
		UPDATE	[dbo].[HPMCON00] 
			SET	CONSTS	=	'81'
			,	CONCDT	=	GetDAte() --@PRM_RCVDTE
			,	CONMTN	=	getdate() --@PRM_RCVPTD
			,	CONMTT	=	getdate() --@PRM_RCVPTD
			,	CONMTU	=	'USER_ID'
		WHERE	CONBRN	=	@PRM_RCVBRN
			AND	CONPDM	=	@PRM_RCVPDM
			AND	CONPDT	=	@PRM_RCVPDT
			AND	CONRUN	=	@PRM_RCVCRN;

-- INSERT INTO [dbo].[HPTCH00]
		INSERT INTO [dbo].[HPTCH00]
			([TCHOUS],[TCHOUD],[TCHOBR],[TCHOTG],[TCHOTT],[TCHORN],[TCHORS],[TCHDTE],[TCHAOC],[TCHCBR]
			,[TCHCPD],[TCHCPT],[TCHCRN],[TCHPRC],[TCHTYP],[TCHCDE],[TCHSUB],[TCHADB],[TCHADC],[TCHRPD]
			,[TCHRPC],[TCHNAD],[TCHNRR],[TCHR01],[TCHR02],[TCHR03],[TCHETD],[TCHETM],[TCHUET])
		VALUES
			('0',GetDate() -- @RCVPTD
			,@PRM_RCVBRN,@PRM_RCVPDM,@PRM_RCVPDT
			,'99999999' --,SP_LS_GET_DBMRUN00(@PRM_RCVBRN, @PRM_RCVPDM, @PRM_RCVPDT, 'CHGSTS','U')c			
			,'0',Getdate() --@RCVDTE
			,'C',@PRM_RCVCBR,@PRM_RCVPDM,@PRM_RCVPDT,@PRM_RCVCRN,'','90'
			,'81','',0,0,0,0,0,0,'',@CONSTS,'',GETDATE(),NULL,'USER_ID')
	end 

END
GO
/****** Object:  StoredProcedure [dbo].[SP_LS_OVERDUE]    Script Date: 05/09/2012 11:44:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
drop procedure SP_LS_OVERDUE

CREATE PROCEDURE [dbo].[SP_LS_OVERDUE](
@PRM_BRN VARCHAR(2),
@PRM_PDM VARCHAR(1),
@PRM_PDT VARCHAR(2),
@PRM_DTE DATETIME
)
AS
BEGIN

  SET NOCOUNT ON;


  select LLSPDTA.dbo.HPMCON00.CONRUN as "ContractNumber"
       , ltrim(rtrim(HLTC_C_CENTER.TH_TITLE_NAME)) + ' ' +
         ltrim(rtrim(HLTC_C_CENTER.TH_FIRST_NAME)) + ' ' +
         ltrim(rtrim(HLTC_C_CENTER.TH_LAST_NAME )) as "CustomerName"
       , LLSPDTA.dbo.HPMCON00.CONDEA as "Dealer"
       , LLSPDTA.dbo.DBMCOA03.CARMDL as "Type"
       , LLSPDTA.dbo.HPMCON00.CONPER as "Tenor"
       , LLSPDTA.dbo.HPMCON00.CONFDT as "FirstDue"
       , LLSPDTA.dbo.HPMCON00.CONLDT as "EndDue"
       , LLSPDTA.dbo.HPMSCN00.SCNRTN as "ResidaulValue"
       , LLSPDTA.dbo.HPMCON00.CONFCA as "AmountFinance"
       , LLSPDTA.dbo.HPMCON00.CONINA as "InstallmentAmount"
       , isnull(HPTINS00.INSAMT,0) as "OverdueAmount"
       , isnull(HPTINS00.INSVAT,0) as "OverdueVAT"
       , isnull(HPTINS00.INSAMT,0) + isnull(HPTINS00.INSVAT,0) as "OverdueTotal"
    from LLSPDTA.dbo.HPMCON00
    left join LLSPDTA.dbo.HPMSCN00 on (LLSPDTA.dbo.HPMCON00.CONBRN = LLSPDTA.dbo.HPMSCN00.SCNBRN
                                   and LLSPDTA.dbo.HPMCON00.CONPDM = LLSPDTA.dbo.HPMSCN00.SCNPDM
                                   and LLSPDTA.dbo.HPMCON00.CONPDT = LLSPDTA.dbo.HPMSCN00.SCNPDT
                                   and LLSPDTA.dbo.HPMCON00.CONRUN = LLSPDTA.dbo.HPMSCN00.SCNRUN)
    left join LLSPDTA.dbo.DBMCOA03 on (LLSPDTA.dbo.DBMCOA03.COATYP = 'C'
                                   and LLSPDTA.dbo.HPMCON00.CONBRN = LLSPDTA.dbo.DBMCOA03.COABRN
                                   and LLSPDTA.dbo.HPMCON00.CONPDM = LLSPDTA.dbo.DBMCOA03.COAPDM
                                   and LLSPDTA.dbo.HPMCON00.CONPDT = LLSPDTA.dbo.DBMCOA03.COAPDT
                                   and LLSPDTA.dbo.HPMCON00.CONRUN = LLSPDTA.dbo.DBMCOA03.COARUN)
    left join (select LLSPDTA.dbo.HPTINS00.INSCRN
                    , sum(LLSPDTA.dbo.HPTINS00.INSIAM)-sum(LLSPDTA.dbo.HPTINS00.INSIRA) as INSAMT
                    , sum(LLSPDTA.dbo.HPTINS00.INSVAM)-sum(LLSPDTA.dbo.HPTINS00.INSVRA) as INSVAT
                 from LLSPDTA.dbo.HPTINS00
               where (LLSPDTA.dbo.HPTINS00.INSIAM-LLSPDTA.dbo.HPTINS00.INSIRA > 0 or LLSPDTA.dbo.HPTINS00.INSVAM-LLSPDTA.dbo.HPTINS00.INSVRA > 0)
                 and LLSPDTA.dbo.HPTINS00.INSDUE < @PRM_DTE
               group by LLSPDTA.dbo.HPTINS00.INSCRN) HPTINS00 on (LLSPDTA.dbo.HPMCON00.CONRUN =  HPTINS00.INSCRN)
    left join DB2..HLCT_APP.HLTC_C_CENTER on (HLTC_C_CENTER.CENTER_CODE = HPMCON00.CONCUS)
   where LLSPDTA.dbo.HPMCON00.CONBRN = @PRM_BRN
     and LLSPDTA.dbo.HPMCON00.CONPDM = @PRM_PDM
     and LLSPDTA.dbo.HPMCON00.CONPDT = @PRM_PDT
     and isnull(HPTINS00.INSAMT,0) + isnull(HPTINS00.INSVAT,0) > 0
   order by LLSPDTA.dbo.HPMCON00.CONRUN;

  RETURN;
END

--EXEC [SP_LS_OVERDUE] '01','2','01','2010-08-31'
GO
/****** Object:  StoredProcedure [dbo].[SP_LS_GEN_HPTINS00]    Script Date: 05/09/2012 11:43:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
drop procedure SP_LS_GEN_HPTINS00

CREATE PROCEDURE [dbo].[SP_LS_GEN_HPTINS00] (
@PRM_CONBRN		varchar(2),
@PRM_CONPDM		varchar(1),
@PRM_CONPDT		varchar(2),
@PRM_CONRUN		varchar(7)
)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

Declare @CONBRN			varchar(2);
Declare @CONPDM			varchar(1);
Declare @CONPDT			varchar(2);
Declare @CONRUN			varchar(7);
Declare @CONDTE			datetime;
Declare @CONHPA			numeric(18, 2);
Declare @CONINA			numeric(18, 2);
Declare @CONHPV			numeric(18, 2);
Declare @CONINV			numeric(18, 2);
Declare @CONDEF			numeric(18, 2);
Declare @CONCMN			numeric(18, 2);
Declare @CONPER			int;
Declare @CONFDT			datetime;
Declare @CONLDT			datetime;
Declare @COUNTER   		int;
Declare @INSDUE_NEXT	datetime;

	declare @HPTINS	table(
	xINSACT varchar(1),
	xINSF11 varchar(1),
	xINSF12 varchar(1),
	xINSF21 varchar(1),
	xINSF22 varchar(1),
	xINSF31 varchar(1),
	xINSF32 varchar(1),
	xINSF41 varchar(1),
	xINSF42 varchar(1),
	xINSF51 varchar(1),
	xINSF52 varchar(1),
	xINSILD datetime,
	xINSVLD datetime,
	xINSDLD datetime,
	xINSCLD datetime,
	xINSPLD datetime,
	xINSCBR varchar(2),
	xINSCPM varchar(1),
	xINSCPT varchar(2),
	xINSCRN varchar(7),
	xINSITM int,
	xINSDUE datetime,
	xINSIAM numeric(11, 2),
	xINSIRA numeric(11, 2),
	xINSVAM numeric(10, 2),
	xINSVPA numeric(10, 2),
	xINSVRA numeric(10, 2),
	xINSDAM numeric(9, 2),
	xINSDRM numeric(9, 2),
	xINSEAM numeric(9, 2),
	xINSERM numeric(9, 2),
	xINSPAM numeric(9, 2),
	xINSPRM numeric(9, 2),
	xINSVRF varchar(15),
	xINSVP1 varchar(1),
	xINSVP2 varchar(1),
	xINSETD datetime,
	xINSETM datetime,
	xINSUET varchar(10),
	xINSMTD datetime,
	xINSMTM datetime,
	xINSUTM varchar(10),
	xINSPVD datetime,
	xINSIAD numeric(11, 2),
	xINSVAD numeric(10, 2),
	xINSPAD numeric(9, 2),
	xINSPVL numeric(9, 2),
	xINSPVR numeric(9, 2),
	xINSPVA numeric(9, 2)
);
declare CUR_HPMCON cursor for 
SELECT	CONBRN,CONPDM,CONPDT,CONRUN,CONDTE,
		CONHPA,CONINA,CONHPV,CONINV,CONDEF,CONCMN,
		CONPER,CONFDT,CONLDT
FROM [dbo].[HPMCON00] C
WHERE C.CONBRN = @PRM_CONBRN
AND C.CONPDM = @PRM_CONPDM
AND C.CONPDT = @PRM_CONPDT
AND C.CONRUN = @PRM_CONRUN
AND C.CONACT = 'A';

open CUR_HPMCON;
fetch next from CUR_HPMCON
 into @CONBRN,@CONPDM,@CONPDT,@CONRUN,@CONDTE,
	  @CONHPA,@CONINA,@CONHPV,@CONINV,@CONDEF,@CONCMN,
	  @CONPER,@CONFDT,@CONLDT;

while (@@fetch_status = 0)
begin	
	set @COUNTER = 0;
	while (@COUNTER <= @CONPER)
	begin
		if (@COUNTER > 0) 
		begin
			insert	into @HPTINS
			VALUES( 'A','3','','3','3','','','','','','',NULL,NULL,NULL,NULL,NULL,
			@CONBRN,@CONPDM,@CONPDT,@CONRUN,@COUNTER,@INSDUE_NEXT,(@CONINA - @CONINV),0,
			@CONINV,0,0,0,0,0,0,0,0,'','','',getdate(), --Date,
			NULL,'EDP',NULL,NULL,'',NULL,0,0,0,0,0,0);

			set @INSDUE_NEXT = dateadd(month, 1, @INSDUE_NEXT);
		end else 
		begin
			insert	into @HPTINS
			VALUES( 'A','','','','','','','','','','',NULL,NULL,NULL,NULL,NULL,
			@CONBRN,@CONPDM,@CONPDT,@CONRUN,@COUNTER,NULL,0,0,
			0,0,0,0,0,0,0,0,0,'','','',getdate(), --Date,
			NULL,'EDP',NULL,NULL,'',NULL,0,0,0,0,0,0);
			set @INSDUE_NEXT = @CONFDT;
		end
		set		@COUNTER = @COUNTER + 1;
	end;

	fetch next from CUR_HPMCON
	into @CONBRN,@CONPDM,@CONPDT,@CONRUN,@CONDTE,
	  @CONHPA,@CONINA,@CONHPV,@CONINV,@CONDEF,@CONCMN,
	  @CONPER,@CONFDT,@CONLDT;
end

close CUR_HPMCON;
deallocate CUR_HPMCON;
	
	insert into [dbo].[HPTINS00] SELECT * FROM @HPTINS;

    -- Insert statements for procedure here
	SELECT * FROM @HPTINS;

	-- exec [dbo].[SP_LS_GEN_HPTINS00] '01','2','01','8100245'
	-- exec [dbo].[SP_LS_GEN_HPTINS00] '01','2','01','8100256'
	-- select * from hptins00 where inscrn = '8100244'
END
GO
/****** Object:  StoredProcedure [dbo].[SP_LS_INS_OR_UPD_HPMLED]    Script Date: 05/09/2012 11:43:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
drop procedure SP_LS_INS_OR_UPD_HPMLED

CREATE PROCEDURE [dbo].[SP_LS_INS_OR_UPD_HPMLED]
(@PRM_MLGACT varchar(1)
,@PRM_MLGCBR varchar(2)
,@PRM_MLGRBR varchar(2)
,@PRM_MLGCPD varchar(1)
,@PRM_MLGCPT varchar(2)
,@PRM_MLGCRU varchar(7)
,@PRM_MLGFRI int
,@PRM_MLGDTE datetime
,@PRM_MLGRPT varchar(3)
,@PRM_MLGTYP varchar(1)
,@PRM_MLGDCT varchar(1)
,@PRM_MLGRPB varchar(1)
,@PRM_MLGRPA int
,@PRM_MLGAMT numeric(11,2)
,@PRM_MLGBNK varchar(2)
,@PRM_MLGBBR varchar(3)
,@PRM_MLGRRN varchar(7)
,@PRM_MLGRDN varchar(12)
,@PRM_MLGRRF varchar(15)
,@PRM_MLGSUB varchar(1)
)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here

/*  Can Duplicate Records
	IF  EXISTS (SELECT TOP 1 * FROM dbo.HPMLED00
		WHERE MLGCBR=@PRM_MLGCBR	
		AND MLGCPD=@PRM_MLGCPD
		AND MLGCPT=@PRM_MLGCPT
		AND MLGCRU=@PRM_MLGCRU
		AND MLGFRI=@PRM_MLGFRI
		AND MLGDTE=@PRM_MLGDTE
		AND MLGRPT=@PRM_MLGRPT)
	begin
		UPDATE [dbo].[HPMLED00] SET
		 MLGACT=@PRM_MLGACT
		,MLGRBR=@PRM_MLGRBR
		,MLGRPT=@PRM_MLGRPT
		,MLGTYP=@PRM_MLGTYP
		,MLGDCT=@PRM_MLGDCT
		,MLGRPB=@PRM_MLGRPB
		,MLGRPA=@PRM_MLGRPA
		,MLGAMT=@PRM_MLGAMT
		,MLGBNK=@PRM_MLGBNK
		,MLGBBR=@PRM_MLGBBR
		,MLGRRN=@PRM_MLGRRN
		,MLGRDN=@PRM_MLGRDN
		,MLGRRF=@PRM_MLGRRF
		,MLGSUB=@PRM_MLGSUB
		WHERE MLGCBR=@PRM_MLGCBR
		AND MLGCPD=@PRM_MLGCPD
		AND MLGCPT=@PRM_MLGCPT
		AND MLGCRU=@PRM_MLGCRU
		AND MLGFRI=@PRM_MLGFRI
		AND MLGDTE=@PRM_MLGDTE
		AND MLGRPT=@PRM_MLGRPT;
	end else 
*/
	select @PRM_MLGDCT = case @PRM_MLGDCT When 'D' then '1' else '2' end;
	begin
		INSERT INTO [dbo].[HPMLED00]
		(MLGACT,MLGCBR,MLGRBR,MLGCPD,MLGCPT,MLGCRU,MLGFRI,
		 MLGDTE,MLGRPT,MLGTYP,MLGDCT,MLGRPB,MLGRPA,MLGAMT,
		 MLGBNK,MLGBBR,MLGRRN,MLGRDN,MLGRRF,MLGSUB)
		VALUES
		(@PRM_MLGACT,@PRM_MLGCBR,@PRM_MLGRBR,@PRM_MLGCPD,@PRM_MLGCPT,@PRM_MLGCRU,@PRM_MLGFRI
		,@PRM_MLGDTE,@PRM_MLGRPT,@PRM_MLGTYP,@PRM_MLGDCT,@PRM_MLGRPB,@PRM_MLGRPA,@PRM_MLGAMT
		,@PRM_MLGBNK,@PRM_MLGBBR,@PRM_MLGRRN,@PRM_MLGRDN,@PRM_MLGRRF,@PRM_MLGSUB);
	end
END
GO
/****** Object:  UserDefinedFunction [dbo].[FN_LS_PENALTY_10]    Script Date: 05/09/2012 11:44:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
drop procedure FN_LS_PENALTY_10

CREATE FUNCTION [dbo].[FN_LS_PENALTY_10](
	@PRM_BRN_I varchar(2),
	@PRM_PDM_I varchar(1),
	@PRM_PDT_I varchar(2),
	@PRM_RUN_I varchar(7),
	@PRM_EFD_I datetime,
	@PRM_MOD_I varchar(1)
)
RETURNS @Table_Var TABLE(
	SLGRBR varchar(2),
	SLGCPD varchar(1),
	SLGCPT varchar(2),
	SLGCRU varchar(7),
	SLGFRI int,
	SLGDTE datetime,
	SLGRPT varchar(3),
	SLGFDT datetime,
	SLGTDT datetime,
	SLGPRT numeric(11,2),
	SLGBAM numeric(11,2),
	SLGTRM numeric(11,0),
	MLGAMT numeric(11,2)
)
AS
BEGIN
	declare @SLGRBR		varchar(2);
	declare @SLGCPD		varchar(1);
	declare @SLGCPT		varchar(2);
	declare @SLGCRU		varchar(7);
	declare @SLGFRI		integer;
	declare @SLGDTE		datetime;
	declare @SLGRPT		varchar(3);
	declare @SLGFDT		datetime;
	declare @SLGTDT		datetime;
	declare @SLGPRT		numeric(11,2);
	declare @SLGBAM		numeric(11,2);
	declare @SLGTRM		numeric(11,0);
	declare @MLGAMT		numeric(11,2);

	declare @GRED_PERIOD		integer;
	declare @GRED_PERIOD_DATE	datetime;
	declare @SLGTRM2			numeric(11,0);
	declare @INSDUE				datetime;

	Set		@GRED_PERIOD = 7;
--  Set @GRED_PERIOD_DATE = dateadd(day, (@GRED_PERIOD * -1), @PRM_EFD_I);
	Set		@SLGPRT = 16.37;

	DECLARE		CUR_HPTINS CURSOR FOR 
	SELECT	INSCBR,INSCPM,INSCPT,INSCRN,INSITM,INSDUE,INSPLD,
			((INSIAM+INSVAM)-(INSIRA+INSVRA))
    FROM	HPTINS00
    WHERE	INSCBR = @PRM_BRN_I
      AND	INSCPM = @PRM_PDM_I
      AND	INSCPT = @PRM_PDT_I
      AND	INSCRN = @PRM_RUN_I
      AND	INSITM > 0
      AND	INSDUE <= @PRM_EFD_I
      AND	((INSF12 <> '0') OR (INSF22 <> '0'))
      AND	((INSPLD is NULL ) OR (INSPLD < @PRM_EFD_I))
    ORDER BY INSITM;
  
	open	CUR_HPTINS;
	fetch next from CUR_HPTINS
	into @SLGRBR,@SLGCPD,@SLGCPT,@SLGCRU,@SLGFRI,@INSDUE,@SLGFDT,@SLGBAM;

	while (@@fetch_status = 0)
	begin		
		Set @SLGRPT = '071';
		Set @SLGFDT = coalesce(@SLGFDT, @INSDUE);
		Set @SLGTDT = @PRM_EFD_I - 1;
		Set @SLGTRM = datediff(day,@SLGFDT,@SLGTDT);        
		--Set @MLGAMT = ((@SLGBAM * @SLGPRT * @SLGTRM)/ 36500);
		Set @MLGAMT = ceiling( ((@SLGBAM * @SLGPRT * @SLGTRM)/ 36500) );


		Set @SLGDTE = @PRM_EFD_I;
		Set @SLGTRM2 = datediff(day,@INSDUE,@SLGTDT);    
		if (@SLGTRM2 > @GRED_PERIOD)
		begin
			INSERT INTO @Table_Var 
			VALUES(@SLGRBR,@SLGCPD,@SLGCPT,@SLGCRU,@SLGFRI,@SLGDTE,@SLGRPT,
				@SLGFDT,@SLGTDT,@SLGPRT,@SLGBAM,@SLGTRM,@MLGAMT);
		end;

		fetch next from CUR_HPTINS
		into @SLGRBR,@SLGCPD,@SLGCPT,@SLGCRU,@SLGFRI,@INSDUE,@SLGFDT,@SLGBAM;
	end;
	close CUR_HPTINS;
	deallocate CUR_HPTINS;

	RETURN 
END
GO
/****** Object:  StoredProcedure [dbo].[zz_sp_cnv_receive]    Script Date: 05/09/2012 11:44:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
drop procedure zz_sp_cnv_receive

CREATE PROCEDURE [dbo].[zz_sp_cnv_receive]
AS
BEGIN
  declare	      @No float
  declare         @Date datetime
  declare         @RL#No# varchar(255)
  declare         @HL#No# varchar(255)
  declare         @Cont# integer
  declare         @CompanyName varchar(255)
  declare         @Due datetime
  declare         @Rentail varchar(255)
  declare         @Good float
  declare         @Vat7 float
  declare         @Total float
  declare         @Remarck varchar(255)

  declare @Mytb table(
  xNo float,
  xDate datetime,
  xRL#No# varchar(255),
  xHL#No# varchar(255),
  xCont# integer,
  xCompanyName varchar(255),
  xDue datetime,
  xRentail varchar(255),
  xGood float,
  xVat7 float,
  xTotal float,
  xRemarck varchar(255)
  )
  DECLARE CUR_RECEIVE4 CURSOR FOR 
	SELECT [No],[Date],[RL#No#],[HL#No#],[Cont#],[Company name],
		[Due],[Rentail],[Good],[Vat 7],[Total],[Remarck]
	FROM [dbo].[RECEIVE4]
	WHERE [Rentail] is not null
      and   coalesce([Remarck],'') = '';
	  --and [Cont#] = 8100002;


	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
  open CUR_RECEIVE4;
  fetch next from CUR_RECEIVE4
   into @No,@Date,@RL#No#,@HL#No#,@Cont#,@CompanyName,
		@Due,@Rentail,@Good,@Vat7,@Total,@Remarck;

  while (@@fetch_status = 0)
  begin		
    insert into @Mytb Values(@No,@Date,@RL#No#,@HL#No#,@Cont#,@CompanyName,
		@Due,@Rentail,@Good,@Vat7,@Total,@Remarck);

	exec [dbo].[zz_sp_update_receive] @Date,@Cont#,@Good,@Vat7,@Total;

	UPDATE [dbo].[RECEIVE4] Set [Remarck] = '1'
	 WHERE [No] = @No;

	fetch next from CUR_RECEIVE4
	into @No,@Date,@RL#No#,@HL#No#,@Cont#,@CompanyName,
			@Due,@Rentail,@Good,@Vat7,@Total,@Remarck;
  end
  close CUR_RECEIVE4;
  deallocate CUR_RECEIVE4;
  
  select * from @Mytb;
  return;
END
GO
/****** Object:  StoredProcedure [dbo].[SP_LS_GET_DBMRUN00]    Script Date: 05/09/2012 11:43:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
drop procedure SP_LS_GET_DBMRUN00

CREATE PROCEDURE [dbo].[SP_LS_GET_DBMRUN00](
--Create PROCEDURE [dbo].[SP_LS_GET_DBMRUN00](
	@PRM_RUNBRN		varchar(2),
	@PRM_RUNAP1		varchar(1),
	@PRM_RUNAP2		varchar(2),
	@PRM_RUNCOD		varchar(6),
	@PRM_FUNC		varchar(1)
)
AS
BEGIN
	Declare		@Count_Rec		Int;
	Declare		@RUNACT			varchar(1);
    Declare		@RUNBRN			varchar(2);
    Declare		@RUNAP1			varchar(1);
    Declare		@RUNAP2			varchar(2);
    Declare		@RUNCOD			varchar(6);
    Declare		@RUNDSC			varchar(30);
    Declare		@RUNNUM			int;
    Declare		@RUNPFX			varchar(15);
    Declare		@RUNSFX			varchar(5);
    Declare		@RUNUPD			int;

	SET NOCOUNT ON;

	set	@Count_Rec	= 0;
	set	@RUNNUM		= 0;
	IF (@PRM_FUNC	=	'U')
	begin
		SELECT	@RUNACT	= RUNACT
			,	@RUNBRN = RUNBRN
			,	@RUNAP1 = RUNAP1
			,	@RUNAP2 = RUNAP2
			,	@RUNCOD = RUNCOD
			,	@RUNDSC = RUNDSC
			,	@RUNNUM = RUNNUM
			,	@RUNPFX = RUNPFX
			,	@RUNSFX = RUNSFX
			,	@RUNUPD = RUNUPD
			,	@Count_Rec	= 1 
		FROM	[dbo].[DBMRUN00]
		WHERE	[RUNBRN]	=	@PRM_RUNBRN
			AND [RUNAP1]	=	@PRM_RUNAP1
			AND [RUNAP2]	=	@PRM_RUNAP2
			AND [RUNCOD]	=	@PRM_RUNCOD;

		set	@RUNNUM		=	@RUNNUM + 1;

		IF  (@Count_Rec  > 0)
		begin
			--UPDATE [LCTPDTA].[dbo].[DBMRUN00]
			UPDATE	[dbo].[DBMRUN00]
			SET		[RUNNUM]	=	@RUNNUM
				,	[RUNUPD]	=	Convert(Int, Convert(Varchar, Getdate(), 112))
			WHERE	[RUNBRN]	=	@PRM_RUNBRN
				AND [RUNAP1]	=	@PRM_RUNAP1
				AND [RUNAP2]	=	@PRM_RUNAP2
				AND [RUNCOD]	=	@PRM_RUNCOD;
		end else 
		begin
			INSERT INTO [dbo].[DBMRUN00]
				([RUNACT],[RUNBRN],[RUNAP1],[RUNAP2],[RUNCOD],[RUNDSC],[RUNNUM],[RUNPFX],[RUNSFX],[RUNUPD])
			VALUES
				('A',@PRM_RUNBRN,@PRM_RUNAP1,@PRM_RUNAP2,@PRM_RUNCOD,'Dummy',1,'','', Convert(Int, Convert(Varchar, Getdate(), 112)) )
		end
	end

	SELECT	Rtrim([RUNPFX]) +
			Right('X000000000000' + Convert(Varchar, RUNNUM) + RUNSFX, 10)
	FROM	[dbo].[DBMRUN00]
	WHERE	[RUNBRN]	=	@PRM_RUNBRN
		AND [RUNAP1]	=	@PRM_RUNAP1
		AND [RUNAP2]	=	@PRM_RUNAP2
		AND [RUNCOD]	=	@PRM_RUNCOD;

/*
Select * FROM	[dbo].[DBMRUN00]
*/
END
GO
/****** Object:  UserDefinedFunction [dbo].[FN_LS_EXEC_FNC]    Script Date: 05/09/2012 11:44:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date, ,>
-- Description:	<Description, ,>
-- =============================================
drop function FN_LS_EXEC_FNC

CREATE FUNCTION [dbo].[FN_LS_EXEC_FNC](
@PRM_BRN VARCHAR(2),
@PRM_PDM VARCHAR(1),
@PRM_PDT VARCHAR(2),
@PRM_RUN VARCHAR(7),
@PRM_DTE DATETIME,
@PRM_RTY VARCHAR(3),
@PRM_FNC VARCHAR(30)
)
RETURNS numeric(11, 2)
--RETURNS  VARCHAR(256)
AS
BEGIN
	-- Declare the return variable here
	DECLARE @ResultAmt numeric(11, 2);
    --DECLARE @FNC_STR VARCHAR(256); 

	-- Add the T-SQL statements to compute the return value here
	--SELECT <@ResultVar, sysname, @Result> = <@Param1, sysname, @p1>

    --set @FNC_STR = N'dbo.' + N'FN_LS_GET_INSTALLMENT ('
/*  set @FNC_STR = N'dbo.' +@PRM_FNC + '('
    + ''''+@PRM_BRN +''','
    + ''''+@PRM_PDM +''','
	+ ''''+@PRM_PDT +''','
	+ ''''+@PRM_RUN +''','
	+ ''''+convert(varchar(10),@PRM_DTE,111)+''''
    +')';
*/
    
    if (@PRM_FNC = 'FN_LS_GET_INSTALLMENT') 
        select @ResultAmt =  [dbo].[FN_LS_GET_INSTALLMENT](@PRM_BRN, @PRM_PDM, @PRM_PDT, @PRM_RUN, @PRM_DTE);
    else if (@PRM_FNC = 'FN_LS_GET_PENALTY') 
        select @ResultAmt = [dbo].[FN_LS_GET_PENALTY](@PRM_BRN, @PRM_PDM, @PRM_PDT, @PRM_RUN, @PRM_DTE,'5');    
    else 
        select @ResultAmt = 0.00;
          

	-- Return the result of the function

    -- RETURN @FNC_STR
    RETURN coalesce(@ResultAmt, 0.00);
END
GO
/****** Object:  StoredProcedure [dbo].[SP_LS_INS_OR_UPD_HPMCAD]    Script Date: 05/09/2012 11:43:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
drop procedure SP_LS_INS_OR_UPD_HPMCAD

CREATE PROCEDURE [dbo].[SP_LS_INS_OR_UPD_HPMCAD]
(@PRM_CADGRC varchar(7)
,@PRM_CADABR varchar(2)
,@PRM_CADAPD varchar(1)
,@PRM_CADAPT varchar(2)
,@PRM_CADARN varchar(7)
,@PRM_CADRPT varchar(3)
,@PRM_CADDDB numeric(13,2)
,@PRM_CADDCR numeric(13,2)
,@PRM_CADUET varchar(10)
,@PRM_CADUTM varchar(10)
)
AS
BEGIN
declare @wrk_CADRPT			varchar(3)

	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	-- SELECT <@Param1, sysname, @p1>, <@Param2, sysname, @p2>

	set @wrk_CADRPT = substring(@PRM_CADRPT,1,2) +'0';
	IF  EXISTS (SELECT TOP 1 * FROM [dbo].[HPMCAD00]
		WHERE CADGRC=@PRM_CADGRC
		AND CADABR=@PRM_CADABR
		AND CADAPD=@PRM_CADAPD
		AND CADAPT=@PRM_CADAPT
		AND CADARN=@PRM_CADARN
		AND CADRPT=@wrk_CADRPT
	)
	begin
		UPDATE [dbo].[HPMCAD00] 
		SET
		-- CADACT=@PRM_CADACT
		--,CADSTS=@PRM_CADSTS
		CADLUD=getdate()
		--,CADFL1=@PRM_CADFL1
		--,CADFL2=@PRM_CADFL2
		--,CADFL3=@PRM_CADFL3
		--,CADGRT=@PRM_CADGRT
		--,CADAOS=@PRM_CADAOS
		--,CADDBF=@PRM_CADDBF
		,CADDDB=(CADDDB + @PRM_CADDDB)
		,CADDCR=(CADDCR + @PRM_CADDCR)
		--,CADMBF=@PRM_CADMBF
		--,CADMDB=@PRM_CADMDB
		--,CADMCR=@PRM_CADMCR
		--,CADYBF=@PRM_CADYBF
		--,CADYDB=@PRM_CADYDB
		--,CADYCR=@PRM_CADYCR
		--,CADETD=@PRM_CADETD
		--,CADETM=@PRM_CADETM
		--,CADUET=@PRM_CADUET
		,CADMTD=getdate() --@PRM_CADMTD
		,CADMTM=getdate()
		,CADUTM=@PRM_CADUTM
		WHERE CADGRC=@PRM_CADGRC
		AND CADABR=@PRM_CADABR
		AND CADAPD=@PRM_CADAPD
		AND CADAPT=@PRM_CADAPT
		AND CADARN=@PRM_CADARN
		AND CADRPT=@wrk_CADRPT;
	end else 
	begin
		INSERT INTO [dbo].[HPMCAD00]
		(CADACT,CADSTS,CADLUD,CADFL1,CADFL2,CADFL3,CADGRT
		,CADGRC,CADABR,CADAPD,CADAPT,CADARN,CADRPT,CADAOS
		,CADDBF,CADDDB,CADDCR,CADMBF,CADMDB,CADMCR
		,CADYBF,CADYDB,CADYCR,CADETD,CADETM,CADUET
		,CADMTD,CADMTM,CADUTM)
		VALUES
		('A','',NULL,'','','',''
		,@PRM_CADGRC,@PRM_CADABR,@PRM_CADAPD,@PRM_CADAPT,@PRM_CADARN,@wrk_CADRPT,(@PRM_CADDDB-@PRM_CADDCR)
		,0.00,@PRM_CADDDB,@PRM_CADDCR,0.00,0.00,0.00
		,0.00,0.00,0.00,getdate(),getdate(),@PRM_CADUET
		,NULL,NULL,@PRM_CADUTM)
	end

END
GO
/****** Object:  UserDefinedFunction [dbo].[FN_LS_GET_RPH_RPD]    Script Date: 05/09/2012 11:44:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
drop function FN_LS_GET_RPH_RPD

CREATE FUNCTION [dbo].[FN_LS_GET_RPH_RPD](	
	@CONCAC varchar(10),
	@CQTCTP varchar(1),
	@CQTSTS varchar(1),
	@RCVUPS varchar(1),
	@RCVRTY varchar(3)
)
RETURNS @MyTableVar TABLE 
(   -- Add the column definitions for the TABLE variable here
	RCVRTY varchar(3),
	RCVPTS varchar(1),
	RCVUPS varchar(1),
	RCVCQS varchar(1),
	RCVGLP varchar(1),
	RCVCBY varchar(1),
	RPDAM1 int,
	RPDAM2 int,
	RPDAM3 int,
	RPDAM4 int,
	RPDAM5 int,
	RPDDT1 int,
	RPDDT2 int,
	RPDDT3 int,
	RPDDT4 int,
	RPDDT5 int,
	RPDDT6 int,
	RPDDT7 int,
	RPDDT8 int,
	RPDDT9 int,
	RPDRF1 varchar(2),
	RPDRF2 varchar(2),
	RPDRF3 varchar(2)
)
AS
BEGIN
	-- Fill the table variable with the rows for your result set
	if EXISTS(
		SELECT H.RPHID FROM HPMRPH00 H
		WHERE H.CONCAC = @CONCAC
		AND H.CQTCTP = @CQTCTP
		AND H.CQTSTS = @CQTSTS
		AND H.RCVUPS = @RCVUPS
		AND H.RCVRTY = @RCVRTY
		AND H.RPHACT = 'A'
	)
	begin
		INSERT INTO @MyTableVar 
		SELECT D.RCVRTY,D.RCVPTS,D.RCVUPS,D.RCVCQS,D.RCVGLP,D.RCVCBY,
			D.RPDAM1,D.RPDAM2,D.RPDAM3,D.RPDAM4,D.RPDAM5,D.RPDDT1,D.RPDDT2,
			D.RPDDT3,D.RPDDT4,D.RPDDT5,D.RPDDT6,D.RPDDT7,D.RPDDT8,D.RPDDT9,
			D.RPDRF1,D.RPDRF2,D.RPDRF3
		FROM HPMRPH00 H
		INNER JOIN HPMRPD00 D
		ON(H.RPHID  = D.RPDNUM)
		AND(H.RPHPRC = D.RPDPRC)
		WHERE H.CONCAC = @CONCAC
		AND H.CQTCTP = @CQTCTP
		AND H.CQTSTS = @CQTSTS
		AND H.RCVUPS = @RCVUPS
		AND H.RCVRTY = @RCVRTY
		AND H.RPHACT = 'A'
		AND D.RPDACT = 'A'
	end	else 
	begin
		INSERT INTO @MyTableVar 
		SELECT D.RCVRTY,D.RCVPTS,D.RCVUPS,D.RCVCQS,D.RCVGLP,D.RCVCBY,
			D.RPDAM1,D.RPDAM2,D.RPDAM3,D.RPDAM4,D.RPDAM5,D.RPDDT1,D.RPDDT2,
			D.RPDDT3,D.RPDDT4,D.RPDDT5,D.RPDDT6,D.RPDDT7,D.RPDDT8,D.RPDDT9,
			D.RPDRF1,D.RPDRF2,D.RPDRF3
		FROM HPMRPH00 H
		INNER JOIN HPMRPD00 D
		ON(H.RPHID  = D.RPDNUM)
		AND(H.RPHPRC = D.RPDPRC)
		WHERE H.CONCAC = @CONCAC
		AND H.CQTCTP = '9'
		AND H.CQTSTS = '9'
		AND H.RCVUPS = '9'
		AND H.RCVRTY = '999'
		AND H.RPHACT = 'A'
		AND D.RPDACT = 'A'
	end
	RETURN 
END
GO
/****** Object:  StoredProcedure [dbo].[SP_UPDATEMASTERCHEQUE]    Script Date: 05/09/2012 11:44:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--EXEC SP_UPDATEMASTERCHEQUE 'RC201201230019'

CREATE PROCEDURE [dbo].[SP_UPDATEMASTERCHEQUE]
	@DOCNO VARCHAR (15),
	@USER  VARCHAR (20),
	@WORK  VARCHAR (60),
	@BRN   VARCHAR (3),
	@PDM   VARCHAR (4),
	@PDT   VARCHAR (3),
	@CHEQUESTATUS CHAR (1),
	@RESONCODE	  CHAR (2),
	@DEPOSITDATE DATETIME,
	@ACCOUNTNUM  VARCHAR (10),
	@COLNO VARCHAR (14)
AS
BEGIN
	DECLARE @CQ_NO		VARCHAR	(7)
	DECLARE @CQ_DATE	DATETIME
	DECLARE @CQ_AMOUNT	NUMERIC	(18,2)
	DECLARE @CQ_BNK_C	CHAR	(3)
	DECLARE @CQ_BRR_C	CHAR	(4)
	DECLARE @CQ_ACCOUNT	VARCHAR (12)
	DECLARE	@CQ_C_TYPE	CHAR	(1)	
	DECLARE @PAT CHAR (2)
	DECLARE @EXPECDATE DATETIME
	SET @PAT = (SELECT BACPAT FROM DBMBAC00 WHERE BACBAC=@ACCOUNTNUM)
	IF LEN(@PAT) = 1 SET @PAT = '0' + @PAT
	
	SELECT @CQ_NO		=CQMCNO, 
		   @CQ_DATE		=CQMDTE,
		   @CQ_AMOUNT	=CQMAMT,
		   @CQ_BNK_C	=CQMBNK,
		   @CQ_BRR_C	=CQMBBR,
		   @CQ_ACCOUNT	=CQMACC,
		   @CQ_C_TYPE	=CQMCTY,
		   @EXPECDATE   =CQMDUE
	FROM CQDM007 
	WHERE CQMDNO=@DOCNO
	
	DECLARE @CHECKCOUNT INT
	DECLARE @NUM		INT
	DECLARE @N			INT
	IF @RESONCODE = '03' OR @RESONCODE = '42'
		SET @NUM = 2			
	ELSE
		SET @NUM = 1
	
	SET @N = 1
	WHILE @N <= @NUM
	BEGIN
		IF (@N = 2 AND @RESONCODE = '03' AND @CHEQUESTATUS = 'Y') 
		OR (@N = 2 AND @RESONCODE = '42' AND @CHEQUESTATUS = 'Y')
			SET @CHEQUESTATUS = 'N'
		
		SET @CHECKCOUNT = 0
		SELECT @CHECKCOUNT=COUNT(*) FROM CQDM011
		WHERE CQMNO2=@CQ_NO
		AND	  CQMDAT=@CQ_DATE
		AND	  CQMAMT=@CQ_AMOUNT
		AND	  CQMBNK=@CQ_BNK_C
		AND	  CQMBBR=@CQ_BRR_C
		AND	  CQMACC=@CQ_ACCOUNT
		AND	  CQMCTY=@CQ_C_TYPE
		AND   CQMCNO=@COLNO
		--AND	  CQMACT='A'
		
		IF @CHECKCOUNT>0
			BEGIN
				UPDATE CQDM011 SET
				CQMACT='A',
				CQMSTS=@CHEQUESTATUS,
				CQMCCQ=@RESONCODE,
				CQMMTD={FN NOW()},
				CQMMTU=@USER,
				CQMMTW=@WORK,
				CQMSTD={FN NOW()}	
				WHERE CQMNO2=@CQ_NO
				AND	  CQMDAT=@CQ_DATE
				AND	  CQMAMT=@CQ_AMOUNT
				AND	  CQMBNK=@CQ_BNK_C
				AND	  CQMBBR=@CQ_BRR_C
				AND	  CQMACC=@CQ_ACCOUNT
				AND	  CQMCTY=@CQ_C_TYPE 
				AND   CQMRFN=@DOCNO
				AND   CQMCNO=@COLNO
			END	
		ELSE
			BEGIN
				INSERT INTO CQDM011
				   ([CQMACT]
				   ,[CQMSTS]
				   ,[CQMBRN]
				   ,[CQMPDM]
				   ,[CQMPDT]
				   ,[CQMCNO]
				   ,[CQMBNK]
				   ,[CQMBBR]
				   --,[CQMNO1]
				   ,[CQMNO2]
				   --,[CQMTYP]
				   ,[CQMCTY]
				   ,[CQMDAT]
				   ,[CQMAMT]
				   ,[CQMDUE]
				   ,[CQMSTD]
				   ,[CQMPAT]
				   ,[CQMTRD]
				   ,[CQMCCQ]
				   --,[CQMCUS]
				   --,[CQMVTP]
				   --,[CQMGEN]
				   ,[CQMVBR]
				   --,[CQMVYY]
				   --,[CQMRUN]
				   --,[CQMITM]
				   --,[CQMPOS]
				   --,[CQMRED]
				   --,[CQMRTD]
				   --,[CQMEXC]
				   ,[CQMDIV]
				   ,[CQMACC]
				   --,[CQMPID]
				   --,[CQMPIN]
				   --,[CQMPBY]
				   ,[CQMRFN]
				   --,[CQMRS1]
				   --,[CQMRS2]
				   --,[CQMRS3]
				   --,[CQMRS4]
				   --,[CQMRS5]
				   --,[CQMRN1]
				   --,[CQMRN2]
				   --,[CQMRN3]
				   --,[CQMRN4]
				   --,[CQMRN5]
				   ,[CQMETD]
				   ,[CQMETU]
				   ,[CQMETW]
				   --,[CQMMTD]
				   --,[CQMMTU]
				   --,[CQMMTW]
				   ,[CQMCRD]
				   ,[CQMCRU]
				   ,[CQMCRW])
				VALUES
				   ('A'
				   ,@CHEQUESTATUS
				   ,@BRN
				   ,@PDM
				   ,@PDT
				   ,@COLNO
				   ,@CQ_BNK_C
				   ,@CQ_BRR_C
				   --,<CQMNO1, VARCHAR(1),>
				   ,@CQ_NO
				   --,<CQMTYP, VARCHAR(1),>
				   ,@CQ_C_TYPE
				   ,@CQ_DATE
				   ,@CQ_AMOUNT
				   ,@EXPECDATE
				   ,{FN NOW()}
				   ,@PAT
				   ,@DEPOSITDATE
				   ,@RESONCODE
				   --,<CQMCUS, VARCHAR(7),>
				   --,<CQMVTP, CHAR(1),>
				   --,<CQMGEN, CHAR(1),>
				   ,'01'
				   --,<CQMVYY, CHAR(2),>
				   --,<CQMRUN, CHAR(6),>
				   --,<CQMITM, CHAR(3),>
				   --,<CQMPOS, CHAR(1),>
				   --,<CQMRED, CHAR(1),>
				   --,<CQMRTD, CHAR(1),>
				   --,<CQMEXC, CHAR(1),>
				   ,'201'
				   ,@CQ_ACCOUNT
				   --,<CQMPID, DATETIME,>
				   --,<CQMPIN, VARCHAR(6),>
				   --,<CQMPBY, CHAR(1),>
				   ,@DOCNO
				   --,<CQMRS1, VARCHAR(50),>
				   --,<CQMRS2, VARCHAR(50),>
				   --,<CQMRS3, VARCHAR(50),>
				   --,<CQMRS4, VARCHAR(50),>
				   --,<CQMRS5, VARCHAR(50),>
				   --,<CQMRN1, NUMERIC(18,2),>
				   --,<CQMRN2, NUMERIC(18,2),>
				   --,<CQMRN3, NUMERIC(18,2),>
				   --,<CQMRN4, NUMERIC(18,2),>
				   --,<CQMRN5, NUMERIC(18,2),>
				   ,{FN NOW()}
				   ,@USER
				   ,@WORK
				   --,<CQMMTD, DATETIME,>
				   --,<CQMMTU, VARCHAR(20),>
				   --,<CQMMTW, VARCHAR(60),>
				   ,{FN NOW()}
				   ,@USER
				   ,@WORK
				   )	
			END
		INSERT INTO CQDT002 
			SELECT [CQMACT]
				  ,[CQMSTS]
				  ,[CQMBRN]
				  ,[CQMPDM]
				  ,[CQMPDT]
				  ,[CQMCNO]
				  ,[CQMBNK]
				  ,[CQMBBR]
				  ,[CQMNO1]
				  ,[CQMNO2]
				  ,[CQMTYP]
				  ,[CQMCTY]
				  ,[CQMDAT]
				  ,[CQMAMT]
				  ,[CQMDUE]
				  ,[CQMSTD]
				  ,[CQMPAT]
				  ,[CQMTRD]
				  ,[CQMCCQ]
				  ,[CQMCUS]
				  ,[CQMVTP]
				  ,[CQMGEN]
				  ,[CQMVBR]
				  ,[CQMVYY]
				  ,[CQMRUN]
				  ,[CQMITM]
				  ,[CQMPOS]
				  ,[CQMRED]
				  ,[CQMRTD]
				  ,[CQMEXC]
				  ,[CQMDIV]
				  ,[CQMACC]
				  ,[CQMPID]
				  ,[CQMPIN]
				  ,[CQMPBY]
				  ,[CQMRFN]
				  ,[CQMRS1]
				  ,[CQMRS2]
				  ,[CQMRS3]
				  ,[CQMRS4]
				  ,[CQMRS5]
				  ,[CQMRN1]
				  ,[CQMRN2]
				  ,[CQMRN3]
				  ,[CQMRN4]
				  ,[CQMRN5]
				  ,[CQMETD]={FN NOW()}
				  ,[CQMETU]=@USER
				  ,[CQMETW]=@WORK
				  ,[CQMMTD]=NULL
				  ,[CQMMTU]=NULL
				  ,[CQMMTW]=NULL
				  ,[CQMCRD]={FN NOW()}
				  ,[CQMCRU]=@USER
				  ,[CQMCRW]=@WORK
			FROM CQDM011  
			WHERE CQMNO2=@CQ_NO
			AND   CQMCNO=@COLNO
			AND	  CQMDAT=@CQ_DATE
			AND	  CQMAMT=@CQ_AMOUNT
			AND	  CQMBNK=@CQ_BNK_C
			AND	  CQMBBR=@CQ_BRR_C
			AND	  (
			CQMACC=@CQ_ACCOUNT OR (CQMACC IS NULL AND @CQ_ACCOUNT IS NULL)
				  )
			AND	  (
			CQMCTY=@CQ_C_TYPE OR (CQMCTY IS NULL AND @CQ_C_TYPE IS NULL)
				  )
		SET @N = @N + 1
	END
	EXEC SP_RCBATCHIU @DOCNO
END
GO
/****** Object:  StoredProcedure [dbo].[SP_SEARCHACCOUNTNUMBER]    Script Date: 05/09/2012 11:44:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--exec SP_SEARCHACCOUNTNUMBER ''

CREATE PROCEDURE [dbo].[SP_SEARCHACCOUNTNUMBER]
	@ACC VARCHAR (12)
AS
BEGIN
		SELECT TB2.*
			,((TB2.INSIAM - TB2.INSVAM) - ((TB2.INSIAM * TB2.WHT) / 100)) AS NET 
		FROM (
		SELECT TB1.CQSCSN AS CSN
			,D.[DLR Name] AS NAME
			,E.CARMDL
			,F.INSIAM
			,F.INSVAM
			,CASE WHEN  ((SELECT top 1 CONPER FROM HPMCON00 WHERE CONRUN=TB1.CQSCSN) < 36) THEN
				(SELECT CAST(CQMVA1 AS INT) FROM CQDM008 WHERE CQMABR='PREFERENCE' and CQMGRP='PREFERENCE' and CQMCDE='WHT_RATE')
			 ELSE
				0		
			 END AS WHT
			 --,F.INSITM
		FROM 
		(
		SELECT B.CQSCSN 
		FROM CQDM007 A
		LEFT JOIN  CQDS003 B ON A.CQMDNO=B.CQSDNO
		WHERE B.CQSCSN IS NOT NULL AND B.CQSCSN<>'' AND A.CQMACC = @ACC
		and A.CQMACC is not null
		GROUP BY B.CQSCSN 
		) AS TB1 
		LEFT JOIN  HPMCON00 C ON TB1.CQSCSN=C.CONRUN 
		LEFT JOIN  DEALER   D ON C.CONDEA=D.Code
		LEFT JOIN  DBMCOA03 E ON TB1.CQSCSN=E.COARUN
		LEFT JOIN (
		SELECT MIN(INSITM) AS INSITM, INSCRN,INSIAM,INSVAM FROM  HPTINS00 WHERE INSF11=3 GROUP BY INSCRN,INSIAM,INSVAM 
		)							   F ON TB1.CQSCSN=F.INSCRN
		) AS TB2
		ORDER BY CSN
END
GO
/****** Object:  StoredProcedure [dbo].[SP_PAYDUE]    Script Date: 05/09/2012 11:44:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_PAYDUE]
	@DT DATETIME,
	@CON varchar(7),
	@NET decimal(18,2)OUTPUT,
	@NETDUE decimal(18,2)OUTPUT,
	@PA decimal(18,2)OUTPUT,
	@GOODS decimal(18,2)OUTPUT,
    @VAT decimal(18,2)OUTPUT,
    @WHT decimal(18,2)OUTPUT

AS
BEGIN
	select @NETDUE=NET from FN_CalcuGoods((SELECT (CONINA-CONINV) FROM HPMCON00 WHERE CONRUN=@CON),@CON)


	IF OBJECT_ID( 'TEMPDB..#GOD' ) IS NOT NULL DROP TABLE #GOD

	select SUM(isnull(INSIAM,0))as GODINS,sum(ISNULL(INSIRA,0))as IRA,GODREC
	into #GOD
	from (
	select SUM(isnull(b.CQSAMT,0))as GODREC 
	from CQDM007 a
	left join CQDS003 b on a.CQMDNO=b.CQSDNO
	left join CQDM011 c on a.CQMDNO=c.CQMRFN
	/*where (
		  (
	      (
				(
				b.CQSCSN=@CON and YEAR(a.CQMDTE)<YEAR(@DT)
				or b.CQSCSN=@CON and YEAR(a.CQMDTE)=YEAR(@DT) and MONTH(a.CQMDTE)<=MONTH(@DT)
				)	       
	      and c.CQMSTS = 'P' 
	      and DAY(c.CQMSTD)= DAY({FN NOW()}) 
	      and month(c.CQMSTD)= month({FN NOW()}) 
	      and year(c.CQMSTD)= year({FN NOW()})
	      ) or
	      (
				(
				b.CQSCSN=@CON and YEAR(a.CQMDTE)<YEAR(@DT)
				or b.CQSCSN=@CON and YEAR(a.CQMDTE)=YEAR(@DT) and MONTH(a.CQMDTE)<=MONTH(@DT)
				)	       
	      and c.CQMSTS = 'N'
	      ) or
	      (
				(
				b.CQSCSN=@CON and YEAR(a.CQMDTE)<YEAR(@DT)
				or b.CQSCSN=@CON and YEAR(a.CQMDTE)=YEAR(@DT) and MONTH(a.CQMDTE)<=MONTH(@DT)
				)	       
	      and c.CQMSTS = 'Y'
	      ) or
	      (
				(
				b.CQSCSN=@CON and YEAR(a.CQMDTE)<YEAR(@DT)
				or b.CQSCSN=@CON and YEAR(a.CQMDTE)=YEAR(@DT) and MONTH(a.CQMDTE)<=MONTH(@DT)
				)	       
	      and c.CQMSTS = 'A'
	      )
	      )and c.CQMACT = 'A'
	      )or 
	      (
	      (
			b.CQSCSN=@CON and YEAR(a.CQMDTE)<YEAR(@DT)
			or b.CQSCSN=@CON and YEAR(a.CQMDTE)=YEAR(@DT) and MONTH(a.CQMDTE)<=MONTH(@DT)
		  )and DAY(a.CQMETD)= DAY({FN NOW()}) 
	      and month(a.CQMETD)= month({FN NOW()}) 
	      and year(a.CQMETD)= year({FN NOW()})
		  )*/
	where (
			(b.CQSCSN=@CON and YEAR(a.CQMDTE)<YEAR(@DT))
			or (b.CQSCSN=@CON and YEAR(a.CQMDTE)=YEAR(@DT) and MONTH(a.CQMDTE)<=MONTH(@DT))
		  )
		  and
		  
		  (
		    (
		    (
			( c.CQMSTS = 'P' 
			  and DAY(c.CQMSTD)= DAY({FN NOW()}) 
			  and month(c.CQMSTD)= month({FN NOW()}) 
			  and year(c.CQMSTD)= year({FN NOW()})
	        ) 
	        or 
			  c.CQMSTS = 'N' 
	        or 
	          c.CQMSTS = 'Y' 
	        or 
	          c.CQMSTS = 'A'
	        ) 
	        and c.CQMACT = 'A'
	        )
	        or
	        --( 
	        --( DAY(a.CQMETD)= DAY({FN NOW()}) 
			--  and month(a.CQMETD)= month({FN NOW()}) 
	        --  and year(a.CQMETD)= year({FN NOW()})	          	        
	        --) 
	        --and
	        --( 
	        --( c.CQMACT <> 'I' 	          
			--  and c.CQMSTS <> 'P' 
	        --  and c.CQMSTS <> 'A' 
	        --  and c.CQMSTS <> 'N' 
	        --  and c.CQMSTS <> 'Y'
	        --)
	        --or 
	          c.CQMACT IS NULL
	        --)
	        --)  
		  ) 
		  and 
		  (
			(
			  a.CQMACT = 'A' and a.CQMDFG = 'R' --and a.CQMSTS <> 'K'
			)
			or
			(
			  a.CQMACT = 'A' and a.CQMDFG = 'I' and a.CQMSTS = 'K'
			  --and DAY(a.CQMETD)= DAY({FN NOW()}) 
			  --and month(a.CQMETD)= month({FN NOW()}) 
	          --and year(a.CQMETD)= year({FN NOW()})	
			)
		  )
		  and b.CQSRCT = 'N'	  	      
		) as REC , HPTINS00
	where INSCRN=@CON and YEAR(INSDUE)<YEAR(@DT)
	   or INSCRN=@CON and YEAR(INSDUE)=YEAR(@DT) and MONTH(INSDUE)<=MONTH(@DT)
	group by GODREC

	select @GOODS=ABS(GOODS),@VAT=ABS(VAT),@WHT=ABS(WHT),@NET=NET from FN_CalcuGoods(
								(select (isnull(GODREC,0)+isnull(IRA,0)) - GODINS from #GOD)
								,@CON)
								
								
	declare @CC int
	select @cc=count(*) 
	from CQDM007 A
	LEFT JOIN CQDS003 B ON A.CQMDNO=B.CQSDNO
	where month(A.CQMDTE) = MONTH(@DT) 
	  And YEAR(A.cqmdte)=YEAR(@DT)
	  AND B.CQSCSN=@CON
	if @CC > 0
		begin		
			IF @NET>0 
				BEGIN
					SET @PA=@NET
					SET @NET=0 
					SET @GOODS=0
					SET @VAT=0
					SET @WHT=0
				END
			ELSE IF @NET<0 
				SET @PA = @NETDUE+@NET
			ELSE 
				SET @PA = 0 
		end
	else
		SET @PA=@NETDUE+@NET 
	SET @NET=ABS(@NET)
	--SELECT @GOODS as GOODS,@VAT AS VAT,@WHT AS WHT,@NET AS NET,@NETDUE AS NETDUE,@PA AS PA
	
END
GO
/****** Object:  StoredProcedure [dbo].[SP_SEARCHDEALERSCODE]    Script Date: 05/09/2012 11:44:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--exec SP_SEARCHDEALERSCODE 'ANC'

CREATE PROCEDURE [dbo].[SP_SEARCHDEALERSCODE]
	@CODE VARCHAR (10)
AS
BEGIN
		SELECT TB2.*
			,((TB2.INSIAM - TB2.INSVAM) - ((TB2.INSIAM * TB2.WHT) / 100)) AS NET 
		FROM (
		SELECT B.CONRUN AS CSN
			,A.[DLR Name] AS NAME
			,E.CARMDL
			,F.INSIAM
			,F.INSVAM
			,CASE WHEN  ((SELECT CONPER FROM HPMCON00 WHERE CONRUN=B.CONRUN) < 36) THEN
				(SELECT CAST(CQMVA1 AS INT) FROM CQDM008 WHERE CQMABR='PREFERENCE' and CQMGRP='PREFERENCE' and CQMCDE='WHT_RATE')
			 ELSE
				0		
			 END AS WHT
			 --,F.INSITM
		FROM  DEALER A
		LEFT JOIN  HPMCON00 B ON A.Code=B.CONDEA		
		LEFT JOIN  HPMCON00 C ON B.CONRUN=C.CONRUN 
		--LEFT JOIN  DEALER   D ON C.CONDEA=D.Code
		LEFT JOIN  DBMCOA03 E ON B.CONRUN=E.COARUN
		LEFT JOIN (
		SELECT MIN(INSITM) AS INSITM, INSCRN,INSIAM,INSVAM FROM  HPTINS00 WHERE INSF11=3 GROUP BY INSCRN,INSIAM,INSVAM 
		)							   F ON B.CONRUN=F.INSCRN
		WHERE B.CONRUN IS NOT NULL AND B.CONRUN<>'' AND A.Code = @CODE 
		) AS TB2
		ORDER BY CSN
END
GO
/****** Object:  StoredProcedure [dbo].[sp_getContractRelated]    Script Date: 05/09/2012 11:43:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
exec sp_getContractRelated '8100043'
exec [192.168.1.210\SQLEXPRESS].[LLSPDTA].[dbo].sp_getContractRelated '8100043'
select * from HPTINS00
*/



CREATE procedure [dbo].[sp_getContractRelated] 
 @ConNo varchar(10)  
as
begin


declare @deaCode varchar(10)
declare @Taxrate decimal(18,0)
--declare @ConNo varchar(10)

--set @ConNo='8100043';
-- get Dealer Code
select @deaCode=CONDEA from HPMCON00 where CONRUN=@ConNo
select @Taxrate=CQMVA1 from CQDM008 where CQMCDE='WHT_RATE'


if object_id( 'tempdb..#temp0001' ) is not  null drop table #temp0001


--select '1'
--else
   --select '2'

-- get contract 
	 
	select 
		b.INSCRN,MIN(INSITM) INSITM,a.CONPER,c.[DLR Name] as DEAName,e.CARMDL 
	into #temp0001		
	from HPMCON00 a  
	left join HPTINS00 b on a.CONRUN = b.INSCRN and INSF11=3 
	left join DEALER c on a.CONDEA=c.Code
	left join DBMCOA03 d on b.INSCRN=d.COARUN 
	left join DBMCAR00 e on d.CARNUM=e.CARNUM
	where a.CONDEA=@deaCode
	and exists(
		select INSCRN from HPTINS00 where INSCRN=a.CONRUN and INSF11=3
	)
	group by b.INSCRN,a.CONPER,c.[DLR Name],e.CARMDL 
	order by b.INSCRN

	select 		
		0 as CHK,
		case 
			when a.CONPER<=36 then ((INSIAM*@Taxrate)/100) else 0
		end as WHT 
		,
		case 
			when a.CONPER<=36 then (INSIAM-((INSIAM*@Taxrate)/100)+INSVAM) else (INSIAM+INSVAM)
		end as NET 		
		,a.*,
		b.*	
	from #temp0001 a 
	left join HPTINS00 b on a.INSCRN=b.INSCRN and a.INSITM=b.INSITM
	order by b.INSDUE,b.INSCRN

end
GO
/****** Object:  StoredProcedure [dbo].[SP_LS_UPD_INS_CAD_LED_CANCEL]    Script Date: 05/09/2012 11:44:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
--CREATE PROCEDURE [dbo].[SP_LS_UPD_INS_CAD_LED_CANCEL](
CREATE PROCEDURE [dbo].[SP_LS_UPD_INS_CAD_LED_CANCEL](
	-- Add the parameters for the stored procedure here
	 @PRM_RCVACT		varchar(1),
	 @PRM_RCVPST		varchar(1),
	 @PRM_RCVPSD		datetime,
	 @PRM_RCVPTS		varchar(1),
	 @PRM_RCVUPS		varchar(1),
	 @PRM_RCVPTD		datetime,
	 @PRM_RCVBRN		varchar(2),
	 @PRM_RCVPDM		varchar(1),
	 @PRM_RCVPDT		varchar(2),
	 @PRM_RCVDOC		varchar(12),
	 @PRM_RCVITM		varchar(2),
	 @PRM_RCVCBR		varchar(2),
	 @PRM_RCVCRN		varchar(7),
	 @PRM_RCVRTY		varchar(3),
	 @PRM_RCVAMT		numeric(11, 2),
	 @PRM_RCVICA		numeric(11, 2),
	 @PRM_RCVRFR		int,
	 @PRM_RCVRTO		int,
	 @PRM_RCVDTE		datetime,
	 @PRM_RCVRBY		varchar(1),
	 @PRM_RCVBCD		varchar(2),
	 @PRM_RCVBBN		varchar(3),
	 @PRM_RCVCQN		varchar(15),
	 @PRM_RCVCQD		datetime,
	 @PRM_RCVGRC		varchar(7),
	 @PRM_RCVPAT		int,
	 @PRM_RCVF04		varchar(1)
)
AS
BEGIN
	declare	@ACDSTS		varchar(1)
	declare	@ACDFL1		varchar(1)
	declare	@ACDFL2		varchar(1)
	declare	@ACDFL3		varchar(1)
	declare	@ACDNET		varchar(1)

    declare @INSACT		VARCHAR(1);
    declare @INSF11		varchar(1);
    declare @INSF12		varchar(1);
    declare @INSF21		varchar(1);
    declare @INSF22		varchar(1);
    declare @INSILD		datetime;
	declare @INSVLD		datetime;
    declare @INSCBR		varchar(2);
    declare @INSCPM		varchar(1);
    declare @INSCPT		varchar(2);
    declare @INSCRN		varchar(7);
    declare @INSITM		int;
    declare @INSDUE		datetime;
    declare @INSIAM		numeric(11,2);
    declare @INSIRA		numeric(11,2);
    declare @INSVAM		numeric(11,2);
    declare @INSVPA		numeric(11,2);
    declare @INSVRA		numeric(11,2);
	declare @INSPVA		numeric(11,2);

    declare	@BAL_AMT	numeric(11,2);
	declare	@RCV_AMT	numeric(11,2);
	declare	@BAL_VAT	numeric(11,2);
	declare	@RCV_VAT	numeric(11,2);
	declare	@CONIRD		int;
	declare	@CONVRD		int;
    declare	@CONLPD		datetime;
	declare	@CONUPDFLG1	varchar(1);
	declare	@CONUPDFLG2	varchar(1);
	declare	@CONUPDFLG3	varchar(1);

	declare	@DR_AMT		numeric(11,2);
	declare	@CR_AMT		numeric(11,2);
	declare	@MLGAMT		numeric(11,2);

	declare @RstCount	int
	declare @UpdFlag	varchar(1)

  DECLARE CUR_HPTINS	CURSOR FOR 
    select	INSACT,INSF11,INSF12,INSF21,INSF22,INSILD,INSVLD,
			INSCBR,INSCPM,INSCPT,INSCRN,INSITM,INSDUE,
			INSIAM,INSIRA,INSVAM,INSVPA,INSVRA,INSPVA
    from [dbo].[HPTINS00]
    where INSCBR = @PRM_RCVCBR
	and INSCPM = @PRM_RCVPDM
	and INSCPT = @PRM_RCVPDT
	and INSCRN = @PRM_RCVCRN
	and INSITM > 0
	and	((INSF11 < '3') or 
		 (INSF21 < '3') or 
		 (INSF22 < '3') or
		 ((INSF12 >= '0') and (INSF12 <= '2')) )
    ORDER BY INSITM DESC;

  DECLARE CUR_HPMACD	CURSOR FOR 
	select ACDSTS,ACDFL1,ACDFL2,ACDFL3,ACDNET
	from [dbo].[hpmacd00]
    where ACDAPD = @PRM_RCVPDM
	and ACDAPT = @PRM_RCVPDT
	and ACDACD = @PRM_RCVRTY;

  declare @HPTINS_TMP table(
           xINSACT varchar(1),
           xINSF11 varchar(1),
           xINSF12 varchar(1),
           xINSF21 varchar(1),
           xINSF22 varchar(1),
           xINSILD datetime,           
		   xINSVLD datetime,
           xINSCBR varchar(2),
           xINSCPM varchar(1),
           xINSCPT varchar(2),
           xINSCRN varchar(7),
           xINSITM int,
           xINSDUE datetime,
           xINSIAM numeric(11,2),
           xINSIRA numeric(11,2),
           xINSVAM numeric(11,2),
           xINSVPA numeric(11,2),
           xINSVRA numeric(11,2),
		   xINSPVA numeric(11,2),
		   xRCV_AMT numeric(11,2),
		   xRCV_VAT numeric(11,2)
  )
  declare @HPMLED_TMP table(
           xMLGACT varchar(1),
           xMLGCBR varchar(2),
           xMLGRBR varchar(2),
           xMLGCPD varchar(1),
           xMLGCPT varchar(2),
           xMLGCRU varchar(7),
           xMLGFRI int,
           xMLGDTE datetime,
           xMLGRPT varchar(3),
           xMLGTYP varchar(1),
           xMLGDCT varchar(1),
           xMLGRPB varchar(1),
           xMLGRPA int,
           xMLGAMT numeric(11,2),
           xMLGBNK varchar(2),
           xMLGBBR varchar(3),
           xMLGRRN varchar(7),
           xMLGRDN varchar(12),
           xMLGRRF varchar(15),
           xMLGSUB varchar(1)
)
  declare @HPMCAD_TMP table(
		xCADGRC varchar(7), 
		xCADABR varchar(2),
		xCADAPD varchar(1),
		xCADAPT varchar(2),
		xCADARN varchar(7),
		xCADRPT varchar(3),
		xCADAOS numeric(11,2),
		xCADDBF numeric(11,2),
		xCADDDB numeric(11,2),
		xCADDCR numeric(11,2)
)
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
  set @RCV_AMT = @PRM_RCVAMT; --@Prm_Good;
  --set @RCV_VAT = 0; --@Prm_Vat;

	SET NOCOUNT ON;
    -- Insert statements for procedure here

  open CUR_HPMACD;
  fetch next from CUR_HPMACD
   into @ACDSTS,@ACDFL1,@ACDFL2,@ACDFL3,@ACDNET;
  close CUR_HPMACD;
  deallocate CUR_HPMACD;

  open CUR_HPTINS;
  fetch next from CUR_HPTINS
   into @INSACT,@INSF11,@INSF12,@INSF21,@INSF22,@INSILD,@INSVLD,
		@INSCBR,@INSCPM,@INSCPT,@INSCRN,@INSITM,@INSDUE,
		@INSIAM,@INSIRA,@INSVAM,@INSVPA,@INSVRA,@INSPVA;

  set	@CONUPDFLG1	='N';
  set	@CONUPDFLG2	='N';
  set	@CONUPDFLG3	='N';
  while ( (@@fetch_status = 0) and (@RCV_AMT > 0) )
  begin		
    if @ACDFL2 = '1' 
	begin
		--set @BAL_AMT = (@INSIAM - @INSIRA)
		set @BAL_AMT = @INSIRA
		if (@BAL_AMT = 0)	goto label_9;

		if (@RCV_AMT > 0) 
		begin
			if (@RCV_AMT >= @BAL_AMT) 
			begin
				set @CONIRD		=	(@INSITM - 1)
				set	@CONUPDFLG1	=	'Y'
				--set @CONLPD		=	@PRM_RCVPTD
				--set @CONUPDFLG3	=	'Y'

				set @INSF11		=	'3'				
				set @INSILD		=	NULL
				set @INSIRA		=	0
				set @MLGAMT		=	@BAL_AMT
				set @RCV_AMT	=	(@RCV_AMT - @BAL_AMT)				
			end else
			begin
				set @CONIRD		=	(@INSITM - 1)
				set	@CONUPDFLG1	=	'Y'
				set @CONLPD		=	@INSILD
				set @CONUPDFLG3	=	'Y'

				set @INSF11		=	'1'				
				--set @INSILD		=	@PRM_RCVPTD
				set @INSIRA		=	@INSIRA - @RCV_AMT
				set @MLGAMT		=	@RCV_AMT
				set @RCV_AMT	=	0				
			end
		end
	end 

	else if @ACDFL2 = '2' 
	begin
	    --set @BAL_AMT = (@INSVAM - @INSVRA)
		set @BAL_AMT = @INSVRA
		if (@BAL_AMT = 0)	goto label_9;

		if (@RCV_AMT > 0) 
		begin
			if (@RCV_AMT >= @BAL_AMT) 
			begin
				set @CONVRD		=	(@INSITM - 1)
				set	@CONUPDFLG2	=	'Y'
				--set @CONLPD		=	@INSVLD
				--set @CONUPDFLG3	=	'Y'

				set @INSF21		=	'3'
				set @INSVLD		=	NULL
				set @INSVRA		=	0
				set @MLGAMT		=	@BAL_AMT
				set @RCV_AMT	=	(@RCV_AMT - @BAL_AMT)
			end else
			begin
				set @CONVRD		=	(@INSITM - 1)
				set	@CONUPDFLG2	=	'Y'
				set @CONLPD		=	@INSVLD
				set @CONUPDFLG3	=	'Y'

				set @INSF21		=	'1'				
				--set @INSVLD		=	@PRM_RCVPTD
				set @INSVRA		=	(@INSVRA - @RCV_AMT)
				set @MLGAMT		=	@RCV_AMT
				set @RCV_AMT	=	0				
			end
		end
	end 

	else if @ACDFL2 = '3' 
	begin
	    --set @BAL_AMT = (@INSVAM - @INSVPA)
		set @BAL_AMT = @INSVPA
		if (@BAL_AMT = 0)	goto label_9;

		if (@RCV_AMT > 0) 
		begin
			if (@RCV_AMT >= @BAL_AMT) 
			begin
				set @INSF22		=	'3'
				set @INSVPA		=	0
				set @MLGAMT		=	@BAL_AMT
				set @RCV_AMT	=	(@RCV_AMT - @BAL_AMT)
			end else
			begin
				set @INSF22		=	'1'
				set @INSVPA		=	(@INSVPA - @RCV_AMT)
				set @MLGAMT		=	@RCV_AMT
				set @RCV_AMT	=	0				
			end
		end
	end 

	else if @ACDFL2 = '4' 
	begin
		--set @BAL_AMT = (@INSIAM - @INSPVA)
		set @BAL_AMT = @INSPVA
		if (@BAL_AMT = 0)	goto label_9;

		if (@RCV_AMT > 0) 
		begin
			if (@RCV_AMT >= @BAL_AMT) 
			begin
				set @INSF12		=	' '
				set @INSF12		=	'3'				
				set @INSPVA		=	0
				set @MLGAMT		=	@BAL_AMT
				set @RCV_AMT	=	(@RCV_AMT - @BAL_AMT)
			end else
			begin
				set @INSF12		=	'1'
				set @INSPVA		=	(@INSPVA - @RCV_AMT)
				set @MLGAMT		=	@RCV_AMT
				set @RCV_AMT	=	0
			end
		end
	end

	insert into @HPTINS_TMP 
    VALUES(@INSACT,@INSF11,@INSF12,@INSF21,@INSF22,@INSILD,@INSVLD,
		@INSCBR,@INSCPM,@INSCPT,@INSCRN,@INSITM,@INSDUE,
		@INSIAM,@INSIRA,@INSVAM,@INSVPA,@INSVRA,@INSPVA,@RCV_AMT,@RCV_VAT);

-- For Test 
--	INSERT INTO @HPMLED_TMP 
--	VALUES('A',@INSCBR,@INSCBR,@INSCPM,@INSCPT,@INSCRN,@INSITM,@PRM_RCVPTD,@PRM_RCVRTY,@PRM_RCVF04,
--		@ACDNET,@PRM_RCVRBY,@PRM_RCVPAT,@MLGAMT,@PRM_RCVBCD,@PRM_RCVBBN,@PRM_RCVCQN,@PRM_RCVDOC,'','0';
	if (@MLGAMT <> 0)
	begin
		EXEC @RstCount = [dbo].[SP_LS_INS_OR_UPD_HPMLED] 
			'A',@INSCBR,@INSCBR,@INSCPM,@INSCPT,@INSCRN,@INSITM,@PRM_RCVPTD,@PRM_RCVRTY,@PRM_RCVF04,
			@ACDNET,@PRM_RCVRBY,@PRM_RCVPAT,@MLGAMT,@PRM_RCVBCD,@PRM_RCVBBN,@PRM_RCVCQN,@PRM_RCVDOC,'','0';
	end

	label_9:
	
    fetch next from CUR_HPTINS
     into @INSACT,@INSF11,@INSF12,@INSF21,@INSF22,@INSILD,@INSVLD,
	      @INSCBR,@INSCPM,@INSCPT,@INSCRN,@INSITM,@INSDUE,
	      @INSIAM,@INSIRA,@INSVAM,@INSVPA,@INSVRA,@INSPVA;
  END;
  close CUR_HPTINS;
  deallocate CUR_HPTINS;
---------
  if ((@ACDFL1 = '1') And (@CONUPDFLG3	=	'N'))
	begin
		set @CONLPD		=	@INSILD
		set @CONUPDFLG3	=	'Y'
	end
---------
  if ((@ACDFL2 = '1') And (@CONUPDFLG3	=	'N'))
	begin
		set @CONLPD		=	@INSVLD
		set @CONUPDFLG3	=	'Y'
	end
---------

  if (@ACDNET = 'D')
  begin
  	--set	@DR_AMT =  @PRM_RCVAMT
	--set	@CR_AMT =  0
  	set	@DR_AMT =  0
	set	@CR_AMT =  @PRM_RCVAMT
  end
  else if (@ACDNET = 'C')
  begin
	--set	@DR_AMT =  0
	--set	@CR_AMT =  @PRM_RCVAMT
	set	@DR_AMT =  @PRM_RCVAMT
	set	@CR_AMT =  0
  end else 
  begin
	--set	@DR_AMT =  @PRM_RCVAMT
	--set	@CR_AMT =  @PRM_RCVAMT
	set	@DR_AMT =  0
	set	@CR_AMT =  0
  end
  EXEC @RstCount = [dbo].[SP_LS_INS_OR_UPD_HPMCAD]
		 @PRM_CADGRC = @PRM_RCVGRC
		,@PRM_CADABR = @PRM_RCVCBR
		,@PRM_CADAPD = @PRM_RCVPDM
		,@PRM_CADAPT = @PRM_RCVPDT
		,@PRM_CADARN = @PRM_RCVCRN
		,@PRM_CADRPT = @PRM_RCVRTY
		,@PRM_CADDDB = @DR_AMT
		,@PRM_CADDCR = @CR_AMT
		,@PRM_CADUET = ''
		,@PRM_CADUTM = '';

  UPDATE [dbo].[HPTINS00] 
    SET	INSF11 = xINSF11
	,	INSF12 = xINSF12
    ,   INSF21 = xINSF21
	,	INSF22 = xINSF22
	,	INSILD = xINSILD
	,	INSVLD = xINSVLD
	,	INSIRA = xINSIRA
	,	INSVPA = xINSVPA
	,	INSVRA = xINSVRA
	,	INSPVA = xINSPVA
	FROM @HPTINS_TMP
   WHERE INSCBR = xINSCBR
	and INSCPM = xINSCPM
	and INSCPT = xINSCPT
	and INSCRN = xINSCRN
	and INSITM = xINSITM; 

  IF ((@CONUPDFLG1 = 'Y') OR (@CONUPDFLG2 = 'Y') OR (@CONUPDFLG3 = 'Y'))
	begin
		UPDATE [dbo].[HPMCON00] SET	
			CONIRD = case @CONUPDFLG1 WHEN 'Y' THEN @CONIRD ELSE CONIRD END
		,	CONVRD = case @CONUPDFLG2 WHEN 'Y' THEN @CONVRD ELSE CONVRD END
		,	CONLPD = case @CONUPDFLG3 WHEN 'Y' THEN @CONLPD ELSE CONLPD END
		where CONBRN = @PRM_RCVCBR
		and CONPDM = @PRM_RCVPDM
		and CONPDT = @PRM_RCVPDT
		and CONRUN = @PRM_RCVCRN;
	end;

/* -- For Test Store Procedure
  INSERT INTO @HPMCAD_TMP 
  select CADGRC, CADABR,CADAPD,CADAPT,CADARN,CADRPT,CADAOS,CADDBF, 
		(CADDDB + @DR_AMT) as CADDDB, (CADDCR + @CR_AMT) as CADDCR
    from [dbo].[HPMCAD00] 
    where CADGRC = @PRM_RCVGRC
	and CADABR = @PRM_RCVCBR
	and CADAPD = @PRM_RCVPDM
	and CADAPT = @PRM_RCVPDT
	and CADARN = @PRM_RCVCRN
	and CADRPT = substring(@PRM_RCVRTY,1,2) +'0';
  SELECT * FROM @HPMCAD_TMP;	
  SELECT * FROM @HPTINS_TMP;
  SELECT * FROM @HPMLED_TMP;
  RETURN 
*/
END
GO
/****** Object:  StoredProcedure [dbo].[SP_LS_GET_RECEIVE]    Script Date: 05/09/2012 11:43:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SP_LS_GET_RECEIVE](
@PRM_BRN VARCHAR(2),
@PRM_PDM VARCHAR(1),
@PRM_PDT VARCHAR(2),
@PRM_RUN VARCHAR(7),
@PRM_DTE DATETIME,
@PRM_FR_SEQ INTEGER,
@PRM_TO_SEQ INTEGER
)
AS
BEGIN
  DECLARE @INI_AMT numeric(11, 2);
  DECLARE @RCV_AMT numeric(11, 2);
  DECLARE @NET_AMT numeric(11, 2);
  DECLARE @TAX_AMT numeric(11, 2);
  DECLARE @WTH_AMT numeric(11, 2);
  --DECLARE @EXEC_FN Varchar(30);

  -- SET NOCOUNT ON added to prevent extra result sets from
  -- interfering with SELECT statements.
  SET NOCOUNT ON;

  -- Insert statements for procedure here
  SELECT 
    A.*, 
    B.*, 
    case 
      when ( coalesce(A.ADFRN2, '') <> '') then
        --dbo.FN_LS_GET_INSTALLMENT(@PRM_BRN, @PRM_PDM, @PRM_PDT, @PRM_RUN, @PRM_DTE)
        --dbo.SP_LS_EXEC_FNC @PRM_BRN, @PRM_PDM, @PRM_PDT, @PRM_RUN, @PRM_DTE, RTrim(A.ADFRTY), RTrim(A.ADFRN1)
        dbo.FN_LS_EXEC_FNC(@PRM_BRN, @PRM_PDM, @PRM_PDT, @PRM_RUN, @PRM_DTE, RTrim(A.ADFRTY), RTrim(A.ADFRN2))

        --exec @EXEC_FN = 'dbo.' || RTRIM(A.ADFRN1)
        --@EXEC_FN(@PRM_BRN, @PRM_PDM, @PRM_PDT, @PRM_RUN, @PRM_DTE)
	    --dbo.[RTRIM(A.ADFRN1)](@PRM_BRN, @PRM_PDM, @PRM_PDT, @PRM_RUN, @PRM_DTE)
      else 0.00
    end as INI_AMT,    
    coalesce(@RCV_AMT, 0.00) as RCV_AMT,  
    coalesce(@NET_AMT, 0.00) as NET_AMT,
    coalesce(@TAX_AMT, 0.00) as TAX_AMT,
    coalesce(@WTH_AMT, 0.00) as WTH_AMT
  FROM [dbo].[HPMADF00] A
  LEFT JOIN [dbo].[HPMACD00] B
   ON(A.ADFPDM = B.ACDAPD)
  AND(A.ADFPDT = B.ACDAPT)	
  AND(A.ADFRTY = B.ACDACD)
  WHERE (A.ADFPDM = @PRM_PDM)
  AND(A.ADFPDT = @PRM_PDT)	
  AND(A.ADFSEQ between @PRM_FR_SEQ and @PRM_TO_SEQ)
  ORDER BY A.ADFSEQ;

  RETURN;
END
GO
/****** Object:  StoredProcedure [dbo].[SP_LS_UPD_CAD_LED_CANCEL]    Script Date: 05/09/2012 11:44:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SP_LS_UPD_CAD_LED_CANCEL](
--ALTER PROCEDURE [dbo].[SP_LS_UPD_CAD_LED_CANCEL](
	-- Add the parameters for the stored procedure here
	 @PRM_RCVACT		varchar(1),
	 @PRM_RCVPST		varchar(1),
	 @PRM_RCVPSD		datetime,
	 @PRM_RCVPTS		varchar(1),
	 @PRM_RCVUPS		varchar(1),
	 @PRM_RCVPTD		datetime,
	 @PRM_RCVBRN		varchar(2),
	 @PRM_RCVPDM		varchar(1),
	 @PRM_RCVPDT		varchar(2),
	 @PRM_RCVDOC		varchar(12),
	 @PRM_RCVITM		varchar(2),
	 @PRM_RCVCBR		varchar(2),
	 @PRM_RCVCRN		varchar(7),
	 @PRM_RCVRTY		varchar(3),
	 @PRM_RCVAMT		numeric(11, 2),
	 @PRM_RCVICA		numeric(11, 2),
	 @PRM_RCVRFR		int,
	 @PRM_RCVRTO		int,
	 @PRM_RCVDTE		datetime,
	 @PRM_RCVRBY		varchar(1),
	 @PRM_RCVBCD		varchar(2),
	 @PRM_RCVBBN		varchar(3),
	 @PRM_RCVCQN		varchar(15),
	 @PRM_RCVCQD		datetime,
	 @PRM_RCVGRC		varchar(7),
	 @PRM_RCVPAT		int,
	 @PRM_RCVF04		varchar(1)
)
AS
BEGIN
	declare	@ACDSTS		varchar(1)
	declare	@ACDFL1		varchar(1)
	declare	@ACDFL2		varchar(1)
	declare	@ACDFL3		varchar(1)
	declare	@ACDNET		varchar(1)

	declare	@DR_AMT		numeric(11,2);
	declare	@CR_AMT		numeric(11,2);

	declare @RstCount	int
	declare @UpdFlag	varchar(1)

  DECLARE CUR_HPMACD	CURSOR FOR 
	select ACDSTS,ACDFL1,ACDFL2,ACDFL3,ACDNET
	from [dbo].[hpmacd00]
    where ACDAPD = @PRM_RCVPDM
	and ACDAPT = @PRM_RCVPDT
	and ACDACD = @PRM_RCVRTY;

  declare @HPMCAD_TMP table(
		xCADGRC varchar(7), 
		xCADABR varchar(2),
		xCADAPD varchar(1),
		xCADAPT varchar(2),
		xCADARN varchar(7),
		xCADRPT varchar(3),
		xCADAOS numeric(11,2),
		xCADDBF numeric(11,2),
		xCADDDB numeric(11,2),
		xCADDCR numeric(11,2)
)
  declare @HPMLED_TMP table(
           xMLGACT varchar(1),
           xMLGCBR varchar(2),
           xMLGRBR varchar(2),
           xMLGCPD varchar(1),
           xMLGCPT varchar(2),
           xMLGCRU varchar(7),
           xMLGFRI int,
           xMLGDTE datetime,
           xMLGRPT varchar(3),
           xMLGTYP varchar(1),
           xMLGDCT varchar(1),
           xMLGRPB varchar(1),
           xMLGRPA int,
           xMLGAMT numeric(11,2),
           xMLGBNK varchar(2),
           xMLGBBR varchar(3),
           xMLGRRN varchar(7),
           xMLGRDN varchar(12),
           xMLGRRF varchar(15),
           xMLGSUB varchar(1)
)
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
    -- Insert statements for procedure here

  open CUR_HPMACD;
  fetch next from CUR_HPMACD
   into @ACDSTS,@ACDFL1,@ACDFL2,@ACDFL3,@ACDNET;
  close CUR_HPMACD;
  deallocate CUR_HPMACD;	

  if (@ACDNET = 'D')
  begin
  	--set	@DR_AMT =  @PRM_RCVAMT
	--set	@CR_AMT =  0
  	set	@DR_AMT =  0
	set	@CR_AMT =  @PRM_RCVAMT
  end
  else if (@ACDNET = 'C')
  begin
	--set	@DR_AMT =  0
	--set	@CR_AMT =  @PRM_RCVAMT
	set	@DR_AMT =  @PRM_RCVAMT
	set	@CR_AMT =  0
  end else 
  begin
	--set	@DR_AMT =  @PRM_RCVAMT
	--set	@CR_AMT =  @PRM_RCVAMT
	set	@DR_AMT =  0
	set	@CR_AMT =  0
  end

  EXEC @RstCount = [dbo].[SP_LS_INS_OR_UPD_HPMCAD]
		 @PRM_CADGRC = @PRM_RCVGRC
		,@PRM_CADABR = @PRM_RCVCBR
		,@PRM_CADAPD = @PRM_RCVPDM
		,@PRM_CADAPT = @PRM_RCVPDT
		,@PRM_CADARN = @PRM_RCVCRN
		,@PRM_CADRPT = @PRM_RCVRTY
		,@PRM_CADDDB = @DR_AMT
		,@PRM_CADDCR = @CR_AMT
		,@PRM_CADUET = ''
		,@PRM_CADUTM = '';

  EXEC @RstCount = [dbo].[SP_LS_INS_OR_UPD_HPMLED]
		'A',@PRM_RCVCBR,@PRM_RCVCBR,@PRM_RCVPDM,@PRM_RCVPDT,@PRM_RCVCRN,@PRM_RCVRFR,@PRM_RCVPTD,@PRM_RCVRTY,@PRM_RCVF04,
		@ACDNET,@PRM_RCVRBY,@PRM_RCVPAT,@PRM_RCVAMT,@PRM_RCVBCD,@PRM_RCVBBN,@PRM_RCVCQN,@PRM_RCVDOC,'','0';

-- For Test 
--  INSERT INTO @HPMLED_TMP 
--	VALUES('A',@PRM_RCVCBR,@PRM_RCVCBR,@PRM_RCVPDM,@PRM_RCVPDT,@PRM_RCVCRN,@PRM_RCVRFR,@PRM_RCVPTD,@PRM_RCVRTY,@PRM_RCVF04,
--		@ACDNET,@PRM_RCVRBY,@PRM_RCVPAT,@PRM_RCVAMT,@PRM_RCVBCD,@PRM_RCVBBN,@PRM_RCVCQN,@PRM_RCVDOC,'','0';


/* --FOR TEST STORE PROCEDURE
  INSERT INTO @HPMCAD_TMP 
  select CADGRC, CADABR,CADAPD,CADAPT,CADARN,CADRPT,CADAOS,CADDBF, 
		(CADDDB + @DR_AMT) as CADDDB, (CADDCR + @CR_AMT) as CADDCR
    from [dbo].[HPMCAD00] 
    where CADGRC = @PRM_RCVGRC
	and CADABR = @PRM_RCVCBR
	and CADAPD = @PRM_RCVPDM
	and CADAPT = @PRM_RCVPDT
	and CADARN = @PRM_RCVCRN
	and CADRPT = substring(@PRM_RCVRTY,1,2) +'0';
  SELECT * FROM @HPMCAD_TMP;
  SELECT * FROM @HPMLED_TMP;
  RETURN 
*/
END
GO
/****** Object:  StoredProcedure [dbo].[SP_LS_UPD_CAD_LED]    Script Date: 05/09/2012 11:44:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SP_LS_UPD_CAD_LED](
	-- Add the parameters for the stored procedure here
	 @PRM_RCVACT		varchar(1),
	 @PRM_RCVPST		varchar(1),
	 @PRM_RCVPSD		datetime,
	 @PRM_RCVPTS		varchar(1),
	 @PRM_RCVUPS		varchar(1),
	 @PRM_RCVPTD		datetime,
	 @PRM_RCVBRN		varchar(2),
	 @PRM_RCVPDM		varchar(1),
	 @PRM_RCVPDT		varchar(2),
	 @PRM_RCVDOC		varchar(12),
	 @PRM_RCVITM		varchar(2),
	 @PRM_RCVCBR		varchar(2),
	 @PRM_RCVCRN		varchar(7),
	 @PRM_RCVRTY		varchar(3),
	 @PRM_RCVAMT		numeric(11, 2),
	 @PRM_RCVICA		numeric(11, 2),
	 @PRM_RCVRFR		int,
	 @PRM_RCVRTO		int,
	 @PRM_RCVDTE		datetime,
	 @PRM_RCVRBY		varchar(1),
	 @PRM_RCVBCD		varchar(2),
	 @PRM_RCVBBN		varchar(3),
	 @PRM_RCVCQN		varchar(15),
	 @PRM_RCVCQD		datetime,
	 @PRM_RCVGRC		varchar(7),
	 @PRM_RCVPAT		int
)
AS
BEGIN
	declare	@ACDSTS		varchar(1)
	declare	@ACDFL1		varchar(1)
	declare	@ACDFL2		varchar(1)
	declare	@ACDFL3		varchar(1)
	declare	@ACDNET		varchar(1)

	declare	@DR_AMT		numeric(11,2);
	declare	@CR_AMT		numeric(11,2);

	declare @RstCount	int
	declare @UpdFlag	varchar(1)

  DECLARE CUR_HPMACD	CURSOR FOR 
	select ACDSTS,ACDFL1,ACDFL2,ACDFL3,ACDNET
	from [dbo].[hpmacd00]
    where ACDAPD = @PRM_RCVPDM
	and ACDAPT = @PRM_RCVPDT
	and ACDACD = @PRM_RCVRTY;

  declare @HPMCAD_TMP table(
		xCADGRC varchar(7), 
		xCADABR varchar(2),
		xCADAPD varchar(1),
		xCADAPT varchar(2),
		xCADARN varchar(7),
		xCADRPT varchar(3),
		xCADAOS numeric(11,2),
		xCADDBF numeric(11,2),
		xCADDDB numeric(11,2),
		xCADDCR numeric(11,2)
)
  declare @HPMLED_TMP table(
           xMLGACT varchar(1),
           xMLGCBR varchar(2),
           xMLGRBR varchar(2),
           xMLGCPD varchar(1),
           xMLGCPT varchar(2),
           xMLGCRU varchar(7),
           xMLGFRI int,
           xMLGDTE datetime,
           xMLGRPT varchar(3),
           xMLGTYP varchar(1),
           xMLGDCT varchar(1),
           xMLGRPB varchar(1),
           xMLGRPA int,
           xMLGAMT numeric(11,2),
           xMLGBNK varchar(2),
           xMLGBBR varchar(3),
           xMLGRRN varchar(7),
           xMLGRDN varchar(12),
           xMLGRRF varchar(15),
           xMLGSUB varchar(1)
)
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
    -- Insert statements for procedure here

  open CUR_HPMACD;
  fetch next from CUR_HPMACD
   into @ACDSTS,@ACDFL1,@ACDFL2,@ACDFL3,@ACDNET;
  close CUR_HPMACD;
  deallocate CUR_HPMACD;	

  if (@ACDNET = 'D')
  begin
  	set	@DR_AMT =  @PRM_RCVAMT
	set	@CR_AMT =  0
  end
  else if (@ACDNET = 'C')
  begin
	set	@DR_AMT =  0
	set	@CR_AMT =  @PRM_RCVAMT
  end else 
  begin
	set	@DR_AMT =  @PRM_RCVAMT
	set	@CR_AMT =  @PRM_RCVAMT
  end

  EXEC @RstCount = [dbo].[SP_LS_INS_OR_UPD_HPMCAD]
		 @PRM_CADGRC = @PRM_RCVGRC
		,@PRM_CADABR = @PRM_RCVCBR
		,@PRM_CADAPD = @PRM_RCVPDM
		,@PRM_CADAPT = @PRM_RCVPDT
		,@PRM_CADARN = @PRM_RCVCRN
		,@PRM_CADRPT = @PRM_RCVRTY
		,@PRM_CADDDB = @DR_AMT
		,@PRM_CADDCR = @CR_AMT
		,@PRM_CADUET = ''
		,@PRM_CADUTM = '';

  EXEC @RstCount = [dbo].[SP_LS_INS_OR_UPD_HPMLED]
		'A',@PRM_RCVCBR,@PRM_RCVCBR,@PRM_RCVPDM,@PRM_RCVPDT,@PRM_RCVCRN,@PRM_RCVRFR,@PRM_RCVPTD,@PRM_RCVRTY,'1',
		@ACDNET,@PRM_RCVRBY,@PRM_RCVPAT,@PRM_RCVAMT,@PRM_RCVBCD,@PRM_RCVBBN,@PRM_RCVCQN,@PRM_RCVDOC,'','0';

-- For Test 
--  INSERT INTO @HPMLED_TMP 
--	VALUES('A',@PRM_RCVCBR,@PRM_RCVCBR,@PRM_RCVPDM,@PRM_RCVPDT,@PRM_RCVCRN,@PRM_RCVRFR,@PRM_RCVPTD,@PRM_RCVRTY,'1',
--		@ACDNET,@PRM_RCVRBY,@PRM_RCVPAT,@PRM_RCVAMT,@PRM_RCVBCD,@PRM_RCVBBN,@PRM_RCVCQN,@PRM_RCVDOC,'','0';


/* --FOR TEST STORE PROCEDURE
  INSERT INTO @HPMCAD_TMP 
  select CADGRC, CADABR,CADAPD,CADAPT,CADARN,CADRPT,CADAOS,CADDBF, 
		(CADDDB + @DR_AMT) as CADDDB, (CADDCR + @CR_AMT) as CADDCR
    from [dbo].[HPMCAD00] 
    where CADGRC = @PRM_RCVGRC
	and CADABR = @PRM_RCVCBR
	and CADAPD = @PRM_RCVPDM
	and CADAPT = @PRM_RCVPDT
	and CADARN = @PRM_RCVCRN
	and CADRPT = substring(@PRM_RCVRTY,1,2) +'0';
  SELECT * FROM @HPMCAD_TMP;
  SELECT * FROM @HPMLED_TMP;
  RETURN 
*/
END
GO
/****** Object:  StoredProcedure [dbo].[SP_LS_UPD_INS_CAD_LED]    Script Date: 05/09/2012 11:44:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SP_LS_UPD_INS_CAD_LED](
	-- Add the parameters for the stored procedure here
	 @PRM_RCVACT		varchar(1),
	 @PRM_RCVPST		varchar(1),
	 @PRM_RCVPSD		datetime,
	 @PRM_RCVPTS		varchar(1),
	 @PRM_RCVUPS		varchar(1),
	 @PRM_RCVPTD		datetime,
	 @PRM_RCVBRN		varchar(2),
	 @PRM_RCVPDM		varchar(1),
	 @PRM_RCVPDT		varchar(2),
	 @PRM_RCVDOC		varchar(12),
	 @PRM_RCVITM		varchar(2),
	 @PRM_RCVCBR		varchar(2),
	 @PRM_RCVCRN		varchar(7),
	 @PRM_RCVRTY		varchar(3),
	 @PRM_RCVAMT		numeric(11, 2),
	 @PRM_RCVICA		numeric(11, 2),
	 @PRM_RCVRFR		int,
	 @PRM_RCVRTO		int,
	 @PRM_RCVDTE		datetime,
	 @PRM_RCVRBY		varchar(1),
	 @PRM_RCVBCD		varchar(2),
	 @PRM_RCVBBN		varchar(3),
	 @PRM_RCVCQN		varchar(15),
	 @PRM_RCVCQD		datetime,
	 @PRM_RCVGRC		varchar(7),
	 @PRM_RCVPAT		int
)
AS
BEGIN
	declare	@ACDSTS		varchar(1)
	declare	@ACDFL1		varchar(1)
	declare	@ACDFL2		varchar(1)
	declare	@ACDFL3		varchar(1)
	declare	@ACDNET		varchar(1)

    declare @INSACT		VARCHAR(1);
    declare @INSF11		varchar(1);
    declare @INSF12		varchar(1);
    declare @INSF21		varchar(1);
    declare @INSF22		varchar(1);
    declare @INSILD		datetime;
	declare @INSVLD		datetime;
    declare @INSCBR		varchar(2);
    declare @INSCPM		varchar(1);
    declare @INSCPT		varchar(2);
    declare @INSCRN		varchar(7);
    declare @INSITM		int;
    declare @INSDUE		datetime;
    declare @INSIAM		numeric(11,2);
    declare @INSIRA		numeric(11,2);
    declare @INSVAM		numeric(11,2);
    declare @INSVPA		numeric(11,2);
    declare @INSVRA		numeric(11,2);
	declare @INSPVA		numeric(11,2);

    declare	@BAL_AMT	numeric(11,2);
	declare	@RCV_AMT	numeric(11,2);
	declare	@BAL_VAT	numeric(11,2);
	declare	@RCV_VAT	numeric(11,2);
	declare	@CONIRD		int;
	declare	@CONVRD		int;
    declare	@CONLPD		datetime;
	declare	@CONUPDFLG1	varchar(1);
	declare	@CONUPDFLG2	varchar(1);
	declare	@CONUPDFLG3	varchar(1);

	declare	@DR_AMT		numeric(11,2);
	declare	@CR_AMT		numeric(11,2);
	declare	@MLGAMT		numeric(11,2);

	declare @RstCount	int
	declare @UpdFlag	varchar(1)

  DECLARE CUR_HPTINS	CURSOR FOR 
    select	INSACT,INSF11,INSF12,INSF21,INSF22,INSILD,INSVLD,
			INSCBR,INSCPM,INSCPT,INSCRN,INSITM,INSDUE,
			INSIAM,INSIRA,INSVAM,INSVPA,INSVRA,INSPVA
    from [dbo].[hptins07]
    where INSCBR = @PRM_RCVCBR
	and INSCPM = @PRM_RCVPDM
	and INSCPT = @PRM_RCVPDT
	and INSCRN = @PRM_RCVCRN
    ORDER BY INSITM;

  DECLARE CUR_HPMACD	CURSOR FOR 
	select ACDSTS,ACDFL1,ACDFL2,ACDFL3,ACDNET
	from [dbo].[hpmacd00]
    where ACDAPD = @PRM_RCVPDM
	and ACDAPT = @PRM_RCVPDT
	and ACDACD = @PRM_RCVRTY;

  declare @HPTINS_TMP table(
           xINSACT varchar(1),
           xINSF11 varchar(1),
           xINSF12 varchar(1),
           xINSF21 varchar(1),
           xINSF22 varchar(1),
           xINSILD datetime,           
		   xINSVLD datetime,
           xINSCBR varchar(2),
           xINSCPM varchar(1),
           xINSCPT varchar(2),
           xINSCRN varchar(7),
           xINSITM int,
           xINSDUE datetime,
           xINSIAM numeric(11,2),
           xINSIRA numeric(11,2),
           xINSVAM numeric(11,2),
           xINSVPA numeric(11,2),
           xINSVRA numeric(11,2),
		   xINSPVA numeric(11,2),
		   xRCV_AMT numeric(11,2),
		   xRCV_VAT numeric(11,2)
  )
  declare @HPMLED_TMP table(
           xMLGACT varchar(1),
           xMLGCBR varchar(2),
           xMLGRBR varchar(2),
           xMLGCPD varchar(1),
           xMLGCPT varchar(2),
           xMLGCRU varchar(7),
           xMLGFRI int,
           xMLGDTE datetime,
           xMLGRPT varchar(3),
           xMLGTYP varchar(1),
           xMLGDCT varchar(1),
           xMLGRPB varchar(1),
           xMLGRPA int,
           xMLGAMT numeric(11,2),
           xMLGBNK varchar(2),
           xMLGBBR varchar(3),
           xMLGRRN varchar(7),
           xMLGRDN varchar(12),
           xMLGRRF varchar(15),
           xMLGSUB varchar(1)
)
  declare @HPMCAD_TMP table(
		xCADGRC varchar(7), 
		xCADABR varchar(2),
		xCADAPD varchar(1),
		xCADAPT varchar(2),
		xCADARN varchar(7),
		xCADRPT varchar(3),
		xCADAOS numeric(11,2),
		xCADDBF numeric(11,2),
		xCADDDB numeric(11,2),
		xCADDCR numeric(11,2)
)
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
  set @RCV_AMT = @PRM_RCVAMT; --@Prm_Good;
  --set @RCV_VAT = 0; --@Prm_Vat;

	SET NOCOUNT ON;
    -- Insert statements for procedure here

  open CUR_HPMACD;
  fetch next from CUR_HPMACD
   into @ACDSTS,@ACDFL1,@ACDFL2,@ACDFL3,@ACDNET;
  close CUR_HPMACD;
  deallocate CUR_HPMACD;

  open CUR_HPTINS;
  fetch next from CUR_HPTINS
   into @INSACT,@INSF11,@INSF12,@INSF21,@INSF22,@INSILD,@INSVLD,
		@INSCBR,@INSCPM,@INSCPT,@INSCRN,@INSITM,@INSDUE,
		@INSIAM,@INSIRA,@INSVAM,@INSVPA,@INSVRA,@INSPVA;

  set	@CONUPDFLG1	='N';
  set	@CONUPDFLG2	='N';
  set	@CONUPDFLG3	='N';
  while ( (@@fetch_status = 0) and (@RCV_AMT > 0) )
  begin		
    if @ACDFL2 = '1' 
	begin
		set @BAL_AMT = (@INSIAM - @INSIRA)
		if (@RCV_AMT > 0) 
		begin
			if (@RCV_AMT >= @BAL_AMT) 
			begin
				set @CONIRD  = @INSITM
				set	@CONUPDFLG1	=	'Y'
				set @CONLPD  = @PRM_RCVPTD
				set	@CONUPDFLG3	=	'Y'

				set @INSF11  = '0'
				set @INSILD  = @PRM_RCVPTD
				set @INSIRA  = @INSIRA + @BAL_AMT
				set @RCV_AMT = @RCV_AMT - @BAL_AMT	
				set @MLGAMT  = @BAL_AMT
			end else
			begin
				set @CONLPD  = @PRM_RCVPTD
				set	@CONUPDFLG3	=	'Y'

				set @INSF11  = '1'
				set @INSILD  = @PRM_RCVPTD
				set @INSIRA  = @INSIRA + @RCV_AMT
				set @MLGAMT  = @RCV_AMT
				set @RCV_AMT = 0				
			end
		end
	end 

	else if @ACDFL2 = '2' 
	begin
	    set @BAL_AMT = (@INSVAM - @INSVRA)
		if (@RCV_AMT > 0) 
		begin
			if (@RCV_AMT >= @BAL_AMT) 
			begin
				set @CONVRD  = @INSITM
				set	@CONUPDFLG2	=	'Y'
				set @CONLPD  = @PRM_RCVPTD
				set	@CONUPDFLG3	=	'Y'

				set @INSF21  = '0'
				set @INSVLD  = @PRM_RCVPTD
				set @INSVRA  = @INSVRA + @BAL_AMT
				set @RCV_AMT = @RCV_AMT - @BAL_AMT		
				set @MLGAMT  = @BAL_AMT
			end else
			begin
				set @CONLPD  = @PRM_RCVPTD
				set	@CONUPDFLG3	=	'Y'

				set @INSF21  = '1'
				set @INSVLD  = @PRM_RCVPTD
				set @INSVRA  = @INSVRA + @RCV_AMT
				set @MLGAMT  = @RCV_AMT
				set @RCV_AMT = 0				
			end
		end
	end 

	else if @ACDFL2 = '3' 
	begin
	    set @BAL_AMT = (@INSVAM - @INSVPA)
		if (@RCV_AMT > 0) 
		begin
			if (@RCV_AMT >= @BAL_AMT) 
			begin
				set @INSF22	 = '0'
				set @INSVPA  = @INSVPA + @BAL_AMT
				set @RCV_AMT = @RCV_AMT - @BAL_AMT	
				set @MLGAMT  = @BAL_AMT
			end else
			begin
				set @INSF22	 = '1'
				set @INSVPA  = @INSVPA + @RCV_AMT
				set @MLGAMT  = @RCV_AMT
				set @RCV_AMT = 0				
			end
		end
	end 

	else if @ACDFL2 = '4' 
	begin
		set @BAL_AMT = (@INSIAM - @INSPVA)
		if (@RCV_AMT > 0) 
		begin
			if (@RCV_AMT >= @BAL_AMT) 
			begin
				set @INSF12	 = '0'
				set @INSPVA  = @INSPVA + @BAL_AMT
				set @RCV_AMT = @RCV_AMT - @BAL_AMT	
				set @MLGAMT  = @BAL_AMT
			end else
			begin
				set @INSF12	 = '1'
				set @INSPVA  = @INSPVA + @RCV_AMT
				set @MLGAMT  = @RCV_AMT
				set @RCV_AMT = 0				
			end
		end
	end

	insert into @HPTINS_TMP 
    VALUES(@INSACT,@INSF11,@INSF12,@INSF21,@INSF22,@INSILD,@INSVLD,
		@INSCBR,@INSCPM,@INSCPT,@INSCRN,@INSITM,@INSDUE,
		@INSIAM,@INSIRA,@INSVAM,@INSVPA,@INSVRA,@INSPVA,@RCV_AMT,@RCV_VAT);

-- For Test 
--	INSERT INTO @HPMLED_TMP 
--	VALUES('A',@INSCBR,@INSCBR,@INSCPM,@INSCPT,@INSCRN,@INSITM,@PRM_RCVPTD,@PRM_RCVRTY,'2',
--		@ACDNET,@PRM_RCVRBY,@PRM_RCVPAT,@MLGAMT,@PRM_RCVBCD,@PRM_RCVBBN,@PRM_RCVCQN,@PRM_RCVDOC,'','0';
	EXEC @RstCount = [dbo].[SP_LS_INS_OR_UPD_HPMLED] 
		'A',@INSCBR,@INSCBR,@INSCPM,@INSCPT,@INSCRN,@INSITM,@PRM_RCVPTD,@PRM_RCVRTY,'1',
		@ACDNET,@PRM_RCVRBY,@PRM_RCVPAT,@MLGAMT,@PRM_RCVBCD,@PRM_RCVBBN,@PRM_RCVCQN,@PRM_RCVDOC,'','0';

    fetch next from CUR_HPTINS
     into @INSACT,@INSF11,@INSF12,@INSF21,@INSF22,@INSILD,@INSVLD,
	      @INSCBR,@INSCPM,@INSCPT,@INSCRN,@INSITM,@INSDUE,
	      @INSIAM,@INSIRA,@INSVAM,@INSVPA,@INSVRA,@INSPVA;
  END;
  close CUR_HPTINS;
  deallocate CUR_HPTINS;

  if (@ACDNET = 'D')
  begin
  	set	@DR_AMT =  @PRM_RCVAMT
	set	@CR_AMT =  0
  end
  else if (@ACDNET = 'C')
  begin
	set	@DR_AMT =  0
	set	@CR_AMT =  @PRM_RCVAMT
  end else 
  begin
	--set	@DR_AMT =  @PRM_RCVAMT
	--set	@CR_AMT =  @PRM_RCVAMT
	set	@DR_AMT =  0
	set	@CR_AMT =  0
  end
  EXEC @RstCount = [dbo].[SP_LS_INS_OR_UPD_HPMCAD]
		 @PRM_CADGRC = @PRM_RCVGRC
		,@PRM_CADABR = @PRM_RCVCBR
		,@PRM_CADAPD = @PRM_RCVPDM
		,@PRM_CADAPT = @PRM_RCVPDT
		,@PRM_CADARN = @PRM_RCVCRN
		,@PRM_CADRPT = @PRM_RCVRTY
		,@PRM_CADDDB = @DR_AMT
		,@PRM_CADDCR = @CR_AMT
		,@PRM_CADUET = ''
		,@PRM_CADUTM = '';

  UPDATE [dbo].[HPTINS00] 
    SET	INSF11 = xINSF11
	,	INSF12 = xINSF12
    ,   INSF21 = xINSF21
	,	INSF22 = xINSF22
	,	INSILD = xINSILD
	,	INSVLD = xINSVLD
	,	INSIRA = xINSIRA
	,	INSVPA = xINSVPA
	,	INSVRA = xINSVRA
	,	INSPVA = xINSPVA
	FROM @HPTINS_TMP
   WHERE INSCBR = xINSCBR
	and INSCPM = xINSCPM
	and INSCPT = xINSCPT
	and INSCRN = xINSCRN
	and INSITM = xINSITM; 

  IF ((@CONUPDFLG1 = 'Y') OR (@CONUPDFLG2 = 'Y') OR (@CONUPDFLG3 = 'Y'))
	begin
		UPDATE [dbo].[HPMCON00] SET	
			CONIRD = case @CONUPDFLG1 WHEN 'Y' THEN @CONIRD ELSE CONIRD END
		,	CONVRD = case @CONUPDFLG2 WHEN 'Y' THEN @CONVRD ELSE CONVRD END
		,	CONLPD = case @CONUPDFLG3 WHEN 'Y' THEN @CONLPD ELSE CONLPD END
		where CONBRN = @PRM_RCVCBR
		and CONPDM = @PRM_RCVPDM
		and CONPDT = @PRM_RCVPDT
		and CONRUN = @PRM_RCVCRN;
	end;

/* -- For Test Store Procedure
  INSERT INTO @HPMCAD_TMP 
  select CADGRC, CADABR,CADAPD,CADAPT,CADARN,CADRPT,CADAOS,CADDBF, 
		(CADDDB + @DR_AMT) as CADDDB, (CADDCR + @CR_AMT) as CADDCR
    from [dbo].[HPMCAD00] 
    where CADGRC = @PRM_RCVGRC
	and CADABR = @PRM_RCVCBR
	and CADAPD = @PRM_RCVPDM
	and CADAPT = @PRM_RCVPDT
	and CADARN = @PRM_RCVCRN
	and CADRPT = substring(@PRM_RCVRTY,1,2) +'0';
  SELECT * FROM @HPMCAD_TMP;	
  SELECT * FROM @HPTINS_TMP;
  SELECT * FROM @HPMLED_TMP;
  RETURN 
*/
END
GO
/****** Object:  StoredProcedure [dbo].[SP_LS_ADD_UPD_VIW_PENALTY]    Script Date: 05/09/2012 11:43:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SP_LS_ADD_UPD_VIW_PENALTY] (
	@PRM_BRN_I	varchar(2),
	@PRM_PDM_I	varchar(1),
	@PRM_PDT_I	varchar(2),
	@PRM_RUN_I	varchar(7),
	@PRM_EFD_I	datetime,
	@PRM_MOD_I	varchar(1)
)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	-- SET NOCOUNT ON;
	declare @Mytb table(
	SLGRBR varchar(2),
	SLGCPD varchar(1),
	SLGCPT varchar(2),
	SLGCRU varchar(7),
	SLGFRI int,
	SLGDTE datetime,
	SLGRPT varchar(3),
	SLGFDT datetime,
	SLGTDT datetime,
	SLGPRT numeric(11,2),
	SLGBAM numeric(11,2),
	SLGTRM numeric(11,0),
	MLGAMT numeric(11,2))

    IF ((@PRM_MOD_I = '6') or (@PRM_MOD_I = '2'))
    begin
      insert into @Mytb
	    SELECT * FROM FN_LS_PENALTY_10(@PRM_BRN_I,@PRM_PDM_I,@PRM_PDT_I,
		              @PRM_RUN_I,@PRM_EFD_I,@PRM_MOD_I); 

	  -- INSERT INTO [dbo].[HPMLED00]	
      INSERT INTO [dbo].[HPMLED00]
        SELECT 'A',SLGRBR,SLGRBR,SLGCPD,SLGCPT,SLGCRU,SLGFRI,SLGDTE,SLGRPT,
               '0','1','8','0',MLGAMT,'','','','','','1'
          FROM @Mytb WHERE MLGAMT > 0;

	  -- INSERT INTO [dbo].[HPSLED00]	
      INSERT INTO [dbo].[HPSLED00]
	    SELECT 'A',SLGRBR,SLGRBR,SLGCPD,SLGCPT,SLGCRU,SLGFRI,SLGDTE,SLGRPT,
               '1',SLGFDT,SLGTDT,SLGPRT,SLGBAM,''
          FROM @Mytb WHERE MLGAMT > 0;

	  -- UPDATE [dbo].[HPTINS00]
	  UPDATE [dbo].[HPTINS00]
		 SET INSF51 = '3'
			,INSPLD = SLGTDT    --Last Calulate Penalty
			,INSPAM = (INSPAM + MLGAMT)			
         FROM @Mytb
		WHERE INSCBR = SLGRBR
		AND INSCPM = SLGCPD
		AND INSCPT = SLGCPT
		AND INSCRN = SLGCRU
		AND INSITM = SLGFRI
		AND MLGAMT > 0;

    end
    ELSE 
    begin
      insert into @Mytb (SLGRBR,SLGCPD,SLGCPT,SLGCRU,MLGAMT)
      SELECT SLGRBR,SLGCPD,SLGCPT,SLGCRU,sum(MLGAMT) as MLGAMT
        FROM FN_LS_PENALTY_10(@PRM_BRN_I,@PRM_PDM_I,@PRM_PDT_I,@PRM_RUN_I,
             @PRM_EFD_I,@PRM_MOD_I)
       GROUP BY SLGRBR,SLGCPD,SLGCPT,SLGCRU;
    end

-- For Test Store Procedure
--	SELECT MLGAMT FROM @mytb;
--	RETURN; 
END
GO
/****** Object:  UserDefinedFunction [dbo].[FN_LS_INQUIRY2]    Script Date: 05/09/2012 11:44:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE FUNCTION [dbo].[FN_LS_INQUIRY2]
(	@Prm_INSCBR			varchar(2),
	@Prm_INSCPM			varchar(1),
	@Prm_INSCPT			varchar(2),
	@Prm_INSCRN			varchar(7),
	@Prm_ASDATE			datetime
)
RETURNS @RESULT_TABLE TABLE
(	INSCBR		varchar(2),
	INSCPM		varchar(1),
	INSCPT		varchar(2),
	INSCRN		varchar(7),
	INSITM		int,
	INSDUE		datetime,
	INSIAM		numeric(11, 2),
	INSIRA		numeric(11, 2),
	BALINS		numeric(11, 2),
	INSVAM		numeric(11, 2),	
	INSVRA		numeric(11, 2),
	BALVAT		numeric(11, 2),
	INSPAM		numeric(11, 2),	
	INSPRM		numeric(11, 2),
	BALPEN		numeric(11, 2),
	BALAMT		numeric(11, 2),
    INSILD		datetime,
    PENALTY_RATE numeric(11, 2),
    NO_DAY		int
)
AS
begin
	declare @INSCBR			varchar(2);
	declare @INSCPM			varchar(1);
	declare @INSCPT			varchar(2);
	declare @INSCRN			varchar(7);
	declare @INSITM			int;
	declare @INSDUE			datetime;
	declare @INSIAM			numeric(11, 2);
	declare @INSIRA			numeric(11, 2);
	declare @INSVAM			numeric(11, 2);	
	declare @INSVRA			numeric(11, 2);
	declare @INSPAM			numeric(11, 2);	
	declare @INSPRM			numeric(11, 2);
	declare @BALINS			numeric(11, 2);
	declare @BALVAT			numeric(11, 2);
	declare @BALPEN			numeric(11, 2);
	declare @BALAMT			numeric(11, 2);
    declare @INSILD			datetime;
    declare @PENALTY_RATE	numeric(11, 2);
    declare @NO_DAY			int;
	declare @Tb_Penalty TABLE(
	xSLGRBR		varchar(2),
	xSLGCPD		varchar(1),
	xSLGCPT		varchar(2),
	xSLGCRU		varchar(7),
	xSLGFRI		int,
	xSLGDTE		datetime,
	xSLGRPT		varchar(3),
	xSLGFDT		datetime,
	xSLGTDT		datetime,
	xSLGPRT		numeric(11,2),
	xSLGBAM		numeric(11,2),
	xSLGTRM		numeric(11,0),
	xMLGAMT		numeric(11,2)
)

	-- Add the SELECT statement with parameter references here
    declare cur_ins cursor for 
	SELECT	INSCBR,INSCPM,INSCPT,INSCRN,INSITM,INSDUE,
			INSIAM,INSIRA,INSVAM,INSVRA,INSPAM,INSPRM,
            INSILD,0,0
	FROM [dbo].[HPTINS00]
	WHERE INSCBR = @Prm_INSCBR
  		and INSCPM = @Prm_INSCPM
  		and INSCPT = @Prm_INSCPT
		and INSCRN = @Prm_INSCRN
		and INSITM > 0
	ORDER BY INSITM;
	
	-- CALULATE PENALTY 
	INSERT INTO @Tb_Penalty SELECT * FROM [dbo].[FN_LS_PENALTY_10]
		(@Prm_INSCBR,@Prm_INSCPM,@Prm_INSCPT,@Prm_INSCRN,@Prm_ASDATE,'5');

	set	@BALINS = 0;
	set	@BALVAT = 0;
	set	@BALPEN = 0;
	set	@BALAMT = 0;
	open cur_ins;
	fetch next from cur_ins into @INSCBR,@INSCPM,@INSCPT, @INSCRN, @INSITM, 
		@INSDUE, @INSIAM, @INSIRA, @INSVAM, @INSVRA, @INSPAM, @INSPRM,
        @INSILD, @PENALTY_RATE, @NO_DAY;
	while (@@fetch_status = 0)
	begin		
		SELECT @INSPAM = (@INSPAM + xMLGAMT) FROM @Tb_Penalty WHERE xSLGFRI = @INSITM;

		set	@BALINS = @BALINS + (@INSIAM - @INSIRA);
		set	@BALVAT = @BALVAT + (@INSVAM - @INSVRA);
		set	@BALPEN = @BALPEN + (@INSPAM - @INSPRM);
		set	@BALAMT = @BALAMT + (@BALINS + @BALVAT + @BALPEN);
		IF  @INSDUE > @Prm_ASDATE 
		BEGIN
			set	@BALINS = 0;
			set	@BALVAT = 0;
			set	@BALPEN = 0;			
			set	@BALAMT = 0;
		END		

		insert into @result_TABLE 
		values(@INSCBR,@INSCPM,@INSCPT,@INSCRN,@INSITM,@INSDUE,@INSIAM,@INSIRA,@BALINS,
			@INSVAM,@INSVRA,@BALVAT, @INSPAM,@INSPRM,@BALPEN, @BALAMT,
            @INSILD, @PENALTY_RATE, @NO_DAY);

		fetch next from cur_ins into @INSCBR,@INSCPM,@INSCPT, @INSCRN, @INSITM, 
			@INSDUE, @INSIAM, @INSIRA, @INSVAM, @INSVRA, @INSPAM, @INSPRM,
            @INSILD, @PENALTY_RATE, @NO_DAY;
	end;
	close cur_ins;
	deallocate cur_ins;

    RETURN;
end
GO
/****** Object:  StoredProcedure [dbo].[zz_sp_cnv_receive5]    Script Date: 05/09/2012 11:44:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[zz_sp_cnv_receive5]
AS
BEGIN
  declare	      @No float
  declare         @Date datetime
  declare         @RL#No# varchar(255)
  declare         @HL#No# varchar(255)
  declare         @Cont# integer
  declare         @CompanyName varchar(255)
  declare         @Due datetime
  declare         @Rentail varchar(255)
  declare         @Good float
  declare         @Vat7 float
  declare         @Total float
  declare         @Remarck varchar(255)

  declare @Mytb table(
  xNo float,
  xDate datetime,
  xRL#No# varchar(255),
  xHL#No# varchar(255),
  xCont# integer,
  xCompanyName varchar(255),
  xDue datetime,
  xRentail varchar(255),
  xGood float,
  xVat7 float,
  xTotal float,
  xRemarck varchar(255)
  )
  DECLARE CUR_RECEIVE5 CURSOR FOR 
	SELECT [No#],[Date],[Cont#],[DEALERS],
		[Good],[Vat],[Receive]
	FROM [dbo].[RECEIVE5] where [Cont#] is not null;



	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
  open CUR_RECEIVE5;
  fetch next from CUR_RECEIVE5
   into @No,@Date,@Cont#,@CompanyName,
		@Good,@Vat7,@Total;

  while (@@fetch_status = 0)
  begin		
    insert into @Mytb Values(@No,@Date,@RL#No#,@HL#No#,@Cont#,@CompanyName,
		@Due,@Rentail,@Good,@Vat7,@Total,@Remarck);

	exec [dbo].[zz_sp_update_receive] @Date,@Cont#,@Good,@Vat7,@Total;

	--UPDATE [dbo].[RECEIVE5] Set [Remarck] = '1'
	 --WHERE [No] = @No;

  fetch next from CUR_RECEIVE5
   into @No,@Date,@Cont#,@CompanyName,
		@Good,@Vat7,@Total;
  end
  close CUR_RECEIVE5;
  deallocate CUR_RECEIVE5;
  
  select * from @Mytb;
  return;
END
GO
/****** Object:  StoredProcedure [dbo].[sp_ALERT]    Script Date: 05/09/2012 11:43:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- exec sp_ALERT

create PROCEDURE [dbo].[sp_ALERT]
AS
BEGIN
 DECLARE @NOW DATETIME
 --SET @NOW = {FN NOW()}
 SET @NOW = '4/7/2012'
 
 declare @DNO varchar(15)
 declare @DTE datetime
 declare @CSN varchar(10)
 declare @AMT decimal(18,2) 
 declare @NET decimal(18,2)
 declare @DUE DATETIME
 declare @NEX DECIMAL(18,2)
 DECLARE @NDTE DATETIME
 declare @GOOD DECIMAL(18,2)
 
 declare @a decimal(18,2)
 declare @b decimal(18,2)
 declare @c decimal(18,2)
 declare @d decimal(18,2)
 declare @e decimal(18,2)
 declare @f decimal(18,2)
 
 IF OBJECT_ID( 'TEMPDB..#ALERT' ) IS NOT NULL DROP TABLE #ALERT
 --CREATE TABLE #ALERT (
 declare @ALERT as table (
					DNO varchar(15),
					DTE datetime,
					CSN varchar(10),
					AMT decimal(18,2), 
					NET decimal(18,2),
					DUE DATETIME,
					NEX DECIMAL(18,2)
					 )
	DECLARE DB_CURSOR1 CURSOR FOR 
	select a.*
		  ,d.CQSNET
		  ,d.CQSAMT
		  --,DATEDIFF(day,@now,DTE)
	from (
	select MAX(E.CQTDNO) AS DNO
		  ,MAX(F.CQMDTE) AS DTE
		  ,H.CQSCSN
	from CQDT001 E
	left join CQDM007 F on E.CQTDNO=F.CQMDNO
	left join CQDM011 G on F.CQMDNO=G.CQMRFN
	left join CQDS003 H on F.CQMDNO=H.CQSDNO
	where ((G.CQMACT='A' and G.CQMSTS='A') or (G.CQMACT is null and G.CQMSTS is null))
	GROUP BY H.CQSCSN
	) as a
	left join CQDS003 d on a.DNO=d.CQSDNO and a.cqscsn=d.cqscsn
	left join cqdm007 b on a.DNO=b.CQMDNO
	where DATEDIFF(DAY,b.CQMETD,DTE)>=30 
	  AND DATEDIFF(day,@NOW,DTE)>=0 
	  AND DATEDIFF(day,@NOW,DTE)<=25
	OPEN DB_CURSOR1  
	FETCH NEXT FROM DB_CURSOR1 INTO @DNO,@DTE,@CSN,@AMT,@NET
	WHILE @@FETCH_STATUS = 0  
	BEGIN  		
		SELECT @DUE=MAX(INSDUE),@GOOD=INSIAM FROM HPTINS00 WHERE INSCRN=@CSN GROUP BY INSDUE,INSIAM--AND MONTH(INSDUE)=MONTH(@DTE) AND YEAR(INSDUE)=YEAR(@DTE) 
		SET @NEX = 0
		WHILE @NEX = 0
		BEGIN
			EXEC SP_PAYDUE @DUE,@CSN,@NEX output,@b output,@c output,@d OUTPUT ,@e ,@f
			IF @NEX <> 0 AND @NEX > @b
			BEGIN
				SET @DUE = DATEADD(MONTH,-1,@DUE)
				SET @NEX = 0	
			END 
			ELSE IF @NEX = 0
			BEGIN
				SET @DUE = DATEADD(MONTH,1,@DUE)
				SET @NEX = 0		
			END
		END
		IF @d = @GOOD OR @d+@AMT > @GOOD
		BEGIN
			SET @DUE = DATEADD(MONTH,-1,@DUE)
		END	
		INSERT INTO @ALERT VALUES(@DNO,@DTE,@CSN,@AMT,@NET,@DUE,@NEX)
	FETCH NEXT FROM DB_CURSOR1 INTO @DNO,@DTE,@CSN,@AMT,@NET 
	END	
	CLOSE DB_CURSOR1  
	DEALLOCATE DB_CURSOR1
	
select a.*
	   ,b.INSITM 
	   ,d.[DLR Name] AS CNAME
	   ,d.[Owner / MD] as dname
	   ,d.[Address] as ADR
	   ,e.ADREMA
	   ,'W'as STS
from @ALERT a
left join HPTINS00 b on a.CSN=b.INSCRN and a.DUE=b.INSDUE
left join HPMCON00 c on a.CSN=c.CONRUN 
left join DEALER d on c.CONDEA=d.Code 
left join DBMADR00 e on a.CSN=e.ADRCON
where not exists (select cqtdno,cqtcsn from CQDT003 where CQTDNO=a.DNO and CQTCSN=a.CSN)
union all
select cqtdno,cqtdte,cqtcsn,cqtamt,cqtnet,cqtdue,cqtnex,cqtins,cqtcna,cqtdna,cqtadr,cqtema,cqtsts from CQDT003
END
-- exec sp_ALERT
GO
/****** Object:  StoredProcedure [dbo].[SP_PROCESSDEPOSIT]    Script Date: 05/09/2012 11:44:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_PROCESSDEPOSIT]
	@CONTRACT   VARCHAR (8),
	@NETAMOUNT  NUMERIC (18,2),
	@CHEQUEDATE DATETIME,
	@CHEQUENUM	VARCHAR (10),
	@BANK		VARCHAR (3),
	@BANKBRANCH VARCHAR (4),
	@COLNO		VARCHAR (14)
	
AS
BEGIN
	DECLARE @CST CHAR (2)
	DECLARE @ETY CHAR (3)
	DECLARE @RMK VARCHAR (50)
	DECLARE @RFN VARCHAR (15)
	DECLARE @DUE DATETIME
	
	DECLARE @NET DECIMAL (18,2)
	DECLARE @NETN DECIMAL (18,2)
	DECLARE @PA DECIMAL (18,2)
	DECLARE @GOODS DECIMAL (18,2)
	DECLARE @VAT DECIMAL (18,2)
	DECLARE @WT DECIMAL (18,2)
		
	DECLARE @ACT CHAR (1)
	SELECT @ACT = CQMACT,@CST=(CQMACT + CQMSTS) FROM CQDM011 
	WHERE CQMNO2 = @CHEQUENUM
	  AND CQMDAT = @CHEQUEDATE
	  AND CQMBNK = @BANK
	  AND CQMBBR = @BANKBRANCH
	  AND CQMAMT = @NETAMOUNT	
	  AND CQMCNO = @COLNO
	IF @ACT <> '' OR @ACT IS NOT NULL
		BEGIN
			SET @ETY = 'EDC'
			SET @RMK = 'DUPLICATE'	
		END
	ELSE
		BEGIN			
			DECLARE @CCC INT
			SELECT @DUE=MAX(INSDUE) FROM HPTINS00 WHERE INSCRN=@CONTRACT
			IF @DUE IS NULL
				BEGIN
					SET @ETY = 'ENI'
					SET @RMK = 'NOT FOUND INSTALLMENT'
				END
			ELSE
				BEGIN
					EXEC SP_PAYDUE @DUE,@CONTRACT,@NET OUTPUT,@NETN  OUTPUT,@PA  OUTPUT,@GOODS  OUTPUT	,@VAT  OUTPUT,@WT  OUTPUT			
					IF @NET = 0
						BEGIN
							SELECT @ACT=CQMACT,@RFN=CQMDNO 
							FROM CQDM007 A
							LEFT JOIN LLSPDTA.DBO.CQDS003 B ON A.CQMDNO=B.CQSDNO
							WHERE A.CQMCNO=@CHEQUENUM
								AND A.CQMDTE=@CHEQUEDATE
								AND A.CQMAMT=@NETAMOUNT
								AND A.CQMBNK=@BANK
								AND A.CQMBBR=@BANKBRANCH
								AND B.CQSCSN=@CONTRACT
							IF @ACT <> '' OR @ACT IS NOT NULL
								BEGIN
									SET @ETY = 'E  '
									SET @RMK = 'RECEIVED(' + @RFN + ')'	
								END
							ELSE
								BEGIN
									SET @ETY = 'EFU'
									SET @RMK = 'FULL'
								END							
						END			
					ELSE
						BEGIN
							/*SELECT @CCC=COUNT(*) 
							FROM CQDM007 A
							LEFT JOIN CQDS003 B ON A.CQMDNO=B.CQSDNO
							WHERE MONTH(A.CQMDTE) = MONTH(@CHEQUEDATE) 
							  AND YEAR(A.CQMDTE) = YEAR(@CHEQUEDATE)
							  AND B.CQSCSN=@CONTRACT*/
							
							DECLARE @DATE  DATETIME
							SET @DATE = DATEADD(DAY,DAY(@DUE) - DAY({FN NOW()}),{FN NOW()})
							EXEC SP_PAYDUE @DATE,@CONTRACT,@NET OUTPUT,@NETN  OUTPUT,@PA  OUTPUT,@GOODS  OUTPUT	,@VAT  OUTPUT,@WT  OUTPUT
							SET @DUE = CONVERT(DATETIME,CONVERT(VARCHAR,@DATE,101),101)
							IF @NET = @NETAMOUNT AND @PA <> 0
								BEGIN
									SELECT @ACT=CQMACT,@RFN=CQMDNO 
									FROM CQDM007 A
									LEFT JOIN CQDS003 B ON A.CQMDNO=B.CQSDNO
									WHERE A.CQMCNO=@CHEQUENUM
									  AND A.CQMDTE=@CHEQUEDATE
									  AND A.CQMAMT=@NETAMOUNT
									  AND A.CQMBNK=@BANK
									  AND A.CQMBBR=@BANKBRANCH
									  AND B.CQSCSN=@CONTRACT
									IF @ACT <> '' OR @ACT IS NOT NULL
										BEGIN
											SET @ETY = 'E  '
											SET @RMK = 'RECEIVED(' + @RFN + ')'	
										END
									ELSE
										BEGIN
											SET @ETY = 'ECA'
											SET @RMK = 'COLLECTION AMOUNTS'
										END
								END
							ELSE
								BEGIN
									SET @NET = 0
									WHILE @NET = 0
									BEGIN																
										EXEC SP_PAYDUE @DATE,@CONTRACT,@NET OUTPUT,@NETN  OUTPUT,@PA  OUTPUT,@GOODS  OUTPUT	,@VAT  OUTPUT,@WT  OUTPUT
										IF @NET = 0 
											SET @DATE = DATEADD(MONTH,1,@DATE)	
										ELSE IF @NET <> 0 AND @NET > @NETN
											BEGIN
												SET @DATE = DATEADD(MONTH,-1,@DATE)
												SET @NET = 0
											END
									END								
									SET @DUE = CONVERT(DATETIME,CONVERT(VARCHAR,@DATE,101),101)
										
									/*ELSE IF @NET = @NETAMOUNT AND @PA = 0 AND @DUE > @CHEQUEDATE AND @CCC > 0
										BEGIN
											SET @ETY = 'EDD'
											SET @RMK = 'DOUPICATE DUE'									
										END*/
										
									IF @NET = @NETAMOUNT AND @PA = 0 AND @DUE >= @CHEQUEDATE
										BEGIN
											SET @ETY = 'E  '
											SET @RMK = ''									
										END
									ELSE IF @DUE < @CHEQUEDATE AND @NETN = @NETAMOUNT-- AND @PA = 0 
										BEGIN
											SET @ETY = 'E'
											SET @RMK = 'OVER DUE'		
										END
									ELSE --IF @NET <> @NETAMOUNT
										BEGIN
											SELECT @ACT=CQMACT,@RFN=CQMDNO  
											FROM CQDM007 A
											LEFT JOIN CQDS003 B ON A.CQMDNO=B.CQSDNO
											WHERE A.CQMCNO=@CHEQUENUM
											  AND A.CQMDTE=@CHEQUEDATE
											  AND A.CQMAMT=@NETAMOUNT
											  AND A.CQMBNK=@BANK
											  AND A.CQMBBR=@BANKBRANCH
											  AND B.CQSCSN=@CONTRACT
											IF @ACT <> '' OR @ACT IS NOT NULL
												BEGIN
													SET @ETY = 'E  '
													SET @RMK = 'RECEIVED(' + @RFN + ')'		
												END
											ELSE
												BEGIN
													SELECT @CCC=COUNT(*) 
													FROM CQDM007 A
													LEFT JOIN CQDS003 B ON A.CQMDNO=B.CQSDNO
													WHERE A.CQMAMT=@NETAMOUNT
													  AND B.CQSCSN=@CONTRACT
													  AND (A.CQMACC IS NULL OR RTRIM(LTRIM(A.CQMACC))='')
													  AND LEFT(A.CQMDNO,1) <> '#' 
													  AND LEFT(A.CQMDNO,1) <> '*'
													  AND NOT EXISTS (SELECT * FROM CQDM011 C WHERE A.CQMDNO = C.CQMRFN)
													IF @CCC > 0 
														BEGIN
															SET @ETY = 'ESR'
															SET @RMK = 'SIMILAR RECEIVED'	
														END
													ELSE
														BEGIN
															SET @ETY = 'EAI'
															SET @RMK = 'AMOUNTS INVALID'
														END
												END
										END
								END
						END
				END
		END
	IF @RMK = 'OVER DUE'
		select @GOODS=Goods, @VAT=VAT, @WT=WHT, @NET=NET 
		from FN_CalcuGoods((select INSIAM from HPTINS00 where INSCRN=@CONTRACT AND INSITM=1),@CONTRACT)
	SELECT @ETY AS ETY
	      ,@RMK AS RMK
	      ,@CST AS CST
	      ,@RFN AS RFN
	      ,@GOODS AS GOODS
	      ,@VAT AS VAT
	      ,@WT  AS WT
	      ,@NET AS NET
	      ,@PA  AS PA
	      ,@DUE AS DUE
END
GO
/****** Object:  StoredProcedure [dbo].[SP_LS_UPD_HPMRCV00]    Script Date: 05/09/2012 11:44:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SP_LS_UPD_HPMRCV00](
@PRM_RCVBRN varchar(2),
@PRM_RCVPDM varchar(1),
@PRM_RCVPDT varchar(2),
@PRM_RCVDOC varchar(12),
@PRM_ASDATE datetime 
)
AS
BEGIN
	declare @RCVACT		varchar(1)
	declare @RCVPST		varchar(1)
	declare @RCVPSD		datetime
	declare @RCVPTS		varchar(1)
	declare @RCVUPS		varchar(1)
	declare @RCVPTD		datetime
	declare @RCVBRN		varchar(2)
	declare @RCVPDM		varchar(1)
	declare @RCVPDT		varchar(2)
	declare @RCVDOC		varchar(12)
	declare @RCVITM		varchar(2)
	declare @RCVCBR		varchar(2)
	declare @RCVCRN		varchar(7)
	declare @RCVRTY		varchar(3)
	declare @RCVAMT		numeric(11, 2)
	declare @RCVICA		numeric(11, 2)
	declare @RCVRFR		int
	declare @RCVRTO		int
	declare @RCVDTE		datetime
	declare @RCVRBY		varchar(1)
	declare @RCVBCD		varchar(2)
	declare @RCVBBN		varchar(3)
	declare @RCVCQN		varchar(15)
	declare @RCVCQD		datetime
	declare @RCVGRC		varchar(7)
	declare @RCVPAT		int
	declare @RCVF04		varchar(1)
	declare @RCVF01		varchar(1)

	declare @ACDSTS		varchar(1)
	declare @ACDFL1		varchar(1)
	declare @ACDFL2		varchar(1)
	declare @ACDFL3		varchar(1)
	declare @ACDNET		varchar(1)

	declare @RstCount	int
	declare @UpdFlag	varchar(1)
	declare @BBFAMT		numeric(11, 2)

	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	declare CUR_HPMRCV cursor for 
	SELECT RCVACT,RCVPST,RCVPSD,RCVPTS,RCVUPS,RCVPTD,
		RCVBRN,RCVPDM,RCVPDT,RCVDOC,RCVITM,RCVCBR,
		RCVCRN,RCVRTY,RCVAMT,RCVICA,RCVRFR,RCVRTO,
		RCVDTE,RCVRBY,RCVBCD,RCVBBN,RCVCQN,RCVCQD,
		RCVGRC,RCVPAT,ACDSTS,ACDFL1,ACDFL2,ACDFL3,
		ACDNET,RCVF04,RCVF01
	FROM [dbo].[HPMRCV00] R
	left join [dbo].[hpmacd00] A
	 ON(R.RCVPDM = A.ACDAPD)
	and(R.RCVPDT = A.ACDAPT) 
	and(R.RCVRTY = A.ACDACD) 
	WHERE R.RCVBRN = @PRM_RCVBRN
	AND R.RCVPDM = @PRM_RCVPDM
	AND R.RCVPDT = @PRM_RCVPDT
	AND R.RCVDOC = @PRM_RCVDOC
	AND R.RCVACT = 'A'
	AND R.RCVUPS <> '0'
	ORDER BY 
	R.RCVDOC, R.RCVITM, R.RCVCBR, R.RCVCRN 
	;
    -- Insert statements for procedure here
	-- SELECT <@Param1, sysname, @p1>, <@Param2, sysname, @p2>
	open CUR_HPMRCV;
	fetch next from CUR_HPMRCV
	into @RCVACT,@RCVPST,@RCVPSD,@RCVPTS,@RCVUPS,@RCVPTD,
		 @RCVBRN,@RCVPDM,@RCVPDT,@RCVDOC,@RCVITM,@RCVCBR,
	     @RCVCRN,@RCVRTY,@RCVAMT,@RCVICA,@RCVRFR,@RCVRTO,
		 @RCVDTE,@RCVRBY,@RCVBCD,@RCVBBN,@RCVCQN,@RCVCQD,
		 @RCVGRC,@RCVPAT,@ACDSTS,@ACDFL1,@ACDFL2,@ACDFL3,
		 @ACDNET,@RCVF04,@RCVF01
	; 
	while (@@fetch_status = 0)
	begin	
		set @UpdFlag = 'N'

		if (@ACDFL1 = '1')
		--1) Calulate Pennalty Option '6' => 'ADD' 
		--2) UPDATE HPTINS00		
		--3) UPDATE HPMLED00
		--4) UPDATE HPMCAD00 
		begin
			if @RCVF04 = '1' -->Normal
			begin
				if @RCVRTY in('012','013','092','094','072','074')
				begin
					exec	@RstCount = [dbo].[SP_LS_ADD_UPD_VIW_PENALTY]
						@RCVCBR,@RCVPDM,@RCVPDT,@RCVCRN,@RCVCQD,'6';
				end
				exec	@RstCount = [dbo].[SP_LS_UPD_INS_CAD_LED]
					@RCVACT,@RCVPST,@RCVPSD,@RCVPTS,@RCVUPS,@RCVPTD,
					@RCVBRN,@RCVPDM,@RCVPDT,@RCVDOC,@RCVITM,@RCVCBR,
					@RCVCRN,@RCVRTY,@RCVAMT,@RCVICA,@RCVRFR,@RCVRTO,
					@RCVDTE,@RCVRBY,@RCVBCD,@RCVBBN,@RCVCQN,@RCVCQD,
					@RCVGRC,@RCVPAT;
			end			
			else if @RCVF04 = '2' -->Cancel
			begin
				exec	@RstCount = [dbo].[SP_LS_UPD_INS_CAD_LED_CANCEL]
					@RCVACT,@RCVPST,@RCVPSD,@RCVPTS,@RCVUPS,@RCVPTD,
					@RCVBRN,@RCVPDM,@RCVPDT,@RCVDOC,@RCVITM,@RCVCBR,
					@RCVCRN,@RCVRTY,@RCVAMT,@RCVICA,@RCVRFR,@RCVRTO,
					@RCVDTE,@RCVRBY,@RCVBCD,@RCVBBN,@RCVCQN,@RCVCQD,
					@RCVGRC,@RCVPAT,@RCVF04;
			end
			if @RstCount = 0 set @UpdFlag = 'Y'
		end 

		else if (@ACDFL1 = '2')
		--2) UPDATE HPMCAD00
		--3) UPDATE HPMLED00 
		begin
			if @RCVF04 = '1' -->Normal
			begin
				exec	@RstCount = [dbo].[SP_LS_UPD_CAD_LED]
					@RCVACT,@RCVPST,@RCVPSD,@RCVPTS,@RCVUPS,@RCVPTD,
					@RCVBRN,@RCVPDM,@RCVPDT,@RCVDOC,@RCVITM,@RCVCBR,
					@RCVCRN,@RCVRTY,@RCVAMT,@RCVICA,@RCVRFR,@RCVRTO,
					@RCVDTE,@RCVRBY,@RCVBCD,@RCVBBN,@RCVCQN,@RCVCQD,
					@RCVGRC,@RCVPAT;
			end 
			else if @RCVF04 = '2' -->Cancel
			begin
				exec	@RstCount = [dbo].[SP_LS_UPD_CAD_LED_CANCEL]
					@RCVACT,@RCVPST,@RCVPSD,@RCVPTS,@RCVUPS,@RCVPTD,
					@RCVBRN,@RCVPDM,@RCVPDT,@RCVDOC,@RCVITM,@RCVCBR,
					@RCVCRN,@RCVRTY,@RCVAMT,@RCVICA,@RCVRFR,@RCVRTO,
					@RCVDTE,@RCVRBY,@RCVBCD,@RCVBBN,@RCVCQN,@RCVCQD,
					@RCVGRC,@RCVPAT,@RCVF04;
			end
			if @RstCount = 0 set @UpdFlag = 'Y'
		end 

		else if (@ACDFL1 = '3')
		--3) UPDATE HPMLED00 
		begin
			if @RCVF04 = '1' -->Normal
			begin
				EXEC	@RstCount = [dbo].[SP_LS_INS_OR_UPD_HPMLED] 
					'A',@RCVCBR,@RCVCBR,@RCVPDM,@RCVPDT,@RCVCRN,@RCVRFR,@RCVPTD,@RCVRTY,@RCVF04,
					@ACDNET,@RCVRBY,@RCVPAT,@RCVAMT,@RCVBCD,@RCVBBN,@RCVCQN,@RCVDOC,'','0';
			end
			else if @RCVF04 = '2' -->Cancel
			begin
				EXEC	@RstCount = [dbo].[SP_LS_INS_OR_UPD_HPMLED] 
					'A',@RCVCBR,@RCVCBR,@RCVPDM,@RCVPDT,@RCVCRN,@RCVRFR,@RCVPTD,@RCVRTY,@RCVF04,
					@ACDNET,@RCVRBY,@RCVPAT,@RCVAMT,@RCVBCD,@RCVBBN,@RCVCQN,@RCVDOC,'','0';
			end
			if @RstCount = 0 set @UpdFlag = 'Y'
		end

		-- UPDATE HPMRCV00
		-- set @UpdFlag = 'N'
		if (@UpdFlag = 'Y')
		begin
			UPDATE [dbo].[HPMRCV00]
			SET		RCVUPS = '0'
			,		RCVPTS = '0'
			WHERE RCVBRN = @RCVBRN
			AND RCVPDM = @RCVPDM
			AND RCVPDT = @RCVPDT
			AND RCVDOC = @RCVDOC
			AND RCVITM = @RCVITM
			AND RCVCBR = @RCVCBR
			AND RCVCRN = @RCVCRN
			AND RCVRTY = @RCVRTY
			AND RCVUPS <> '0';
		end

		-- UPDATE HPMRCV00
		if 	((@RCVF01 = '1')	OR (@RCVRTY in('012','013')))
		begin
			set		@BBFAMT = 0;
			SELECT	@BBFAMT = SUM(CADDBF + CADDDB - CADDCR) 
			  FROM	[dbo].[HPMCAD00]
			 WHERE	CADABR	= @RCVCBR
			   AND	CADAPD	= @RCVPDM
			   AND	CADAPT	= @RCVPDT
			   AND	CADARN	= @RCVCRN
			   AND	CADRPT	= '010';

			--if (@BBFAMT = 0)
			--begin
			--	EXEC	@RstCount = [dbo].[SP_LS_UPD_CONSTS]
			--			@RCVBRN,@RCVPDM,@RCVPDT,@RCVDOC,@RCVITM,@RCVCBR,@RCVCRN,@RCVRTY
			--end
		end
		--
		fetch next from CUR_HPMRCV
		into @RCVACT,@RCVPST,@RCVPSD,@RCVPTS,@RCVUPS,@RCVPTD,
			@RCVBRN,@RCVPDM,@RCVPDT,@RCVDOC,@RCVITM,@RCVCBR,
			@RCVCRN,@RCVRTY,@RCVAMT,@RCVICA,@RCVRFR,@RCVRTO,
			@RCVDTE,@RCVRBY,@RCVBCD,@RCVBBN,@RCVCQN,@RCVCQD,
			@RCVGRC,@RCVPAT,@ACDSTS,@ACDFL1,@ACDFL2,@ACDFL3,
			@ACDNET,@RCVF04,@RCVF01
		; 
	end
	close CUR_HPMRCV;
	deallocate CUR_HPMRCV;
END
GO
/****** Object:  StoredProcedure [dbo].[SP_LS_DAYEND]    Script Date: 05/09/2012 11:43:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SP_LS_DAYEND](
@PRM_RCBBRN		varchar(2),
@PRM_RCBPDM		varchar(1),
@PRM_RCBPDT		varchar(2),
@PRM_ASDATE		datetime 
)
AS
BEGIN
declare @RCBBRN		varchar(2)
declare @RCBPDM		varchar(1)
declare @RCBPDT		varchar(2)
declare @RCBDOC		varchar(12)
declare @RCBRTM		varchar(12)
declare @RCBDDT		datetime

declare @MyTable	table(
xRCBBRN		varchar(2),
xRCBPDM		varchar(1),
xRCBPDT		varchar(2),
xRCBDOC		varchar(12),
xRCBRTM		varchar(12),
xRCBDDT		datetime
)

-- SET NOCOUNT ON added to prevent extra result sets from
-- interfering with SELECT statements.
SET NOCOUNT ON;

declare CUR_HPTRCB cursor for 
SELECT 
	RCBBRN,RCBPDM,RCBPDT,RCBDOC,RCBRTM,RCBDDT
FROM [dbo].[HPTRCB00] B
WHERE B.RCBBRN = @PRM_RCBBRN
AND B.RCBPDM = @PRM_RCBPDM
AND B.RCBPDT = @PRM_RCBPDT
AND B.RCBDDT <= @PRM_ASDATE
AND B.RCBPST = '2'
AND B.RCBACT = 'A'
ORDER BY 
	B.RCBDDT,
    B.RCBDOC
;

-- Insert statements for procedure here
-- SELECT <@Param1, sysname, @p1>, <@Param2, sysname, @p2>
open CUR_HPTRCB;
fetch next from CUR_HPTRCB
 into @RCBBRN,@RCBPDM,@RCBPDT,@RCBDOC,@RCBRTM,@RCBDDT;

while (@@fetch_status = 0)
begin	

--  001 GEN_HPMRCV00
	EXEC [dbo].[SP_LS_GEN_HPMRCV00] @RCBBRN,@RCBPDM,@RCBPDT,@RCBDOC,@RCBDDT;

--  002 PRINT TAX INVOICE
--  003 PRINT RECEIPT

--  004 UPD_HPMRCV00
	EXEC [dbo].[SP_LS_UPD_HPMRCV00] @RCBBRN,@RCBPDM,@RCBPDT,@RCBDOC,@RCBDDT;
--  END PROCESS

	insert into @MyTable values(@RCBBRN,@RCBPDM,@RCBPDT,@RCBDOC,@RCBRTM,@RCBDDT);
	fetch next from CUR_HPTRCB
  	 into @RCBBRN,@RCBPDM,@RCBPDT,@RCBDOC,@RCBRTM,@RCBDDT;
end
close CUR_HPTRCB;
deallocate CUR_HPTRCB;

select * from @MyTable;
return;
END
GO
/****** Object:  StoredProcedure [dbo].[SP_LS_DAYEND_BY_DOC]    Script Date: 05/09/2012 11:43:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SP_LS_DAYEND_BY_DOC](
@PRM_RCBBRN		varchar(2),
@PRM_RCBPDM		varchar(1),
@PRM_RCBPDT		varchar(2),
@PRM_RCBDOC		varchar(12)
)
AS
BEGIN
declare @RCBBRN		varchar(2)
declare @RCBPDM		varchar(1)
declare @RCBPDT		varchar(2)
declare @RCBDOC		varchar(12)
declare @RCBRTM		varchar(12)
declare @RCBDDT		datetime

declare @MyTable	table(
xRCBBRN		varchar(2),
xRCBPDM		varchar(1),
xRCBPDT		varchar(2),
xRCBDOC		varchar(12),
xRCBRTM		varchar(12),
xRCBDDT		datetime
)

-- SET NOCOUNT ON added to prevent extra result sets from
-- interfering with SELECT statements.
SET NOCOUNT ON;

declare CUR_HPTRCB cursor for 
SELECT 
	RCBBRN,RCBPDM,RCBPDT,RCBDOC,RCBRTM,RCBDDT
FROM [dbo].[HPTRCB00] B
WHERE B.RCBBRN = @PRM_RCBBRN
AND B.RCBPDM = @PRM_RCBPDM
AND B.RCBPDT = @PRM_RCBPDT
AND B.RCBDOC = @PRM_RCBDOC
AND B.RCBPST = '2'
AND B.RCBACT = 'A'
ORDER BY 
	B.RCBDDT,
    B.RCBDOC
;

-- Insert statements for procedure here
-- SELECT <@Param1, sysname, @p1>, <@Param2, sysname, @p2>
open CUR_HPTRCB;
fetch next from CUR_HPTRCB
 into @RCBBRN,@RCBPDM,@RCBPDT,@RCBDOC,@RCBRTM,@RCBDDT;

while (@@fetch_status = 0)
begin	

--  001 GEN_HPMRCV00
	EXEC [dbo].[SP_LS_GEN_HPMRCV00] @RCBBRN,@RCBPDM,@RCBPDT,@RCBDOC,@RCBDDT;

--  002 PRINT TAX INVOICE
--  003 PRINT RECEIPT

--  004 UPD_HPMRCV00
	EXEC [dbo].[SP_LS_UPD_HPMRCV00] @RCBBRN,@RCBPDM,@RCBPDT,@RCBDOC,@RCBDDT;
--  END PROCESS

	insert into @MyTable values(@RCBBRN,@RCBPDM,@RCBPDT,@RCBDOC,@RCBRTM,@RCBDDT);
	fetch next from CUR_HPTRCB
  	 into @RCBBRN,@RCBPDM,@RCBPDT,@RCBDOC,@RCBRTM,@RCBDDT;
end
close CUR_HPTRCB;
deallocate CUR_HPTRCB;

select * from @MyTable;
return;
END
GO

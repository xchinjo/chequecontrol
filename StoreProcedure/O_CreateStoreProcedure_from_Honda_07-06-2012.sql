USE [LLSODTA]
GO
/****** Object:  StoredProcedure [dbo].[SP_UPDATEMASTERCHEQUE]    Script Date: 06/07/2012 18:22:59 ******/
DROP PROCEDURE [dbo].[SP_UPDATEMASTERCHEQUE]
GO
/****** Object:  StoredProcedure [dbo].[SP_PROCESSDEPOSIT]    Script Date: 06/07/2012 18:22:58 ******/
DROP PROCEDURE [dbo].[SP_PROCESSDEPOSIT]
GO
/****** Object:  StoredProcedure [dbo].[SP_SEARCHDEALERSCODE]    Script Date: 06/07/2012 18:22:59 ******/
DROP PROCEDURE [dbo].[SP_SEARCHDEALERSCODE]
GO
/****** Object:  StoredProcedure [dbo].[SP_SEARCHACCOUNTNUMBER]    Script Date: 06/07/2012 18:22:59 ******/
DROP PROCEDURE [dbo].[SP_SEARCHACCOUNTNUMBER]
GO
/****** Object:  StoredProcedure [dbo].[sp_getContractRelated]    Script Date: 06/07/2012 18:22:57 ******/
DROP PROCEDURE [dbo].[sp_getContractRelated]
GO
/****** Object:  StoredProcedure [dbo].[SP_ALERT]    Script Date: 06/07/2012 18:22:57 ******/
DROP PROCEDURE [dbo].[SP_ALERT]
GO
/****** Object:  StoredProcedure [dbo].[SP_NETAMT]    Script Date: 06/07/2012 18:22:58 ******/
DROP PROCEDURE [dbo].[SP_NETAMT]
GO
/****** Object:  StoredProcedure [dbo].[sp_getInsPeriod]    Script Date: 06/07/2012 18:22:58 ******/
DROP PROCEDURE [dbo].[sp_getInsPeriod]
GO
/****** Object:  UserDefinedFunction [dbo].[fn_GetChqPaymentByDue]    Script Date: 06/07/2012 18:23:08 ******/
DROP FUNCTION [dbo].[fn_GetChqPaymentByDue]
GO
/****** Object:  StoredProcedure [dbo].[SP_GETHISTORY]    Script Date: 06/07/2012 18:22:58 ******/
DROP PROCEDURE [dbo].[SP_GETHISTORY]
GO
/****** Object:  StoredProcedure [dbo].[SP_UPDATERECEIVE]    Script Date: 06/07/2012 18:22:59 ******/
DROP PROCEDURE [dbo].[SP_UPDATERECEIVE]
GO
/****** Object:  StoredProcedure [dbo].[SP_PAYDUE]    Script Date: 06/07/2012 18:22:58 ******/
DROP PROCEDURE [dbo].[SP_PAYDUE]
GO
/****** Object:  StoredProcedure [dbo].[SP_RESTORERECEIVE]    Script Date: 06/07/2012 18:22:59 ******/
DROP PROCEDURE [dbo].[SP_RESTORERECEIVE]
GO
/****** Object:  StoredProcedure [dbo].[SP_PROCESSRESULT]    Script Date: 06/07/2012 18:22:58 ******/
DROP PROCEDURE [dbo].[SP_PROCESSRESULT]
GO
/****** Object:  StoredProcedure [dbo].[SP_RUNNINGDOC]    Script Date: 06/07/2012 18:22:59 ******/
DROP PROCEDURE [dbo].[SP_RUNNINGDOC]
GO
/****** Object:  UserDefinedFunction [dbo].[fn_getInsPeriod]    Script Date: 06/07/2012 18:23:08 ******/
DROP FUNCTION [dbo].[fn_getInsPeriod]
GO
/****** Object:  UserDefinedFunction [dbo].[FN_CalcuGoods]    Script Date: 06/07/2012 18:23:06 ******/
DROP FUNCTION [dbo].[FN_CalcuGoods]
GO
/****** Object:  UserDefinedFunction [dbo].[fn_GetChqPayment]    Script Date: 06/07/2012 18:23:07 ******/
DROP FUNCTION [dbo].[fn_GetChqPayment]
GO
/****** Object:  StoredProcedure [dbo].[sp_RCBatchIU]    Script Date: 06/07/2012 18:22:59 ******/
DROP PROCEDURE [dbo].[sp_RCBatchIU]
GO
/****** Object:  StoredProcedure [dbo].[sp_getEmailRelatedDtl]    Script Date: 06/07/2012 18:22:57 ******/
DROP PROCEDURE [dbo].[sp_getEmailRelatedDtl]
GO
/****** Object:  StoredProcedure [dbo].[sp_getEmailRelated]    Script Date: 06/07/2012 18:22:57 ******/
DROP PROCEDURE [dbo].[sp_getEmailRelated]
GO
/****** Object:  StoredProcedure [dbo].[SP_MAIL]    Script Date: 06/07/2012 18:22:58 ******/
DROP PROCEDURE [dbo].[SP_MAIL]
GO
/****** Object:  StoredProcedure [dbo].[sp_getPayRelatedDtl]    Script Date: 06/07/2012 18:22:58 ******/
DROP PROCEDURE [dbo].[sp_getPayRelatedDtl]
GO
/****** Object:  StoredProcedure [dbo].[sp_getPayRelatedHdr]    Script Date: 06/07/2012 18:22:58 ******/
DROP PROCEDURE [dbo].[sp_getPayRelatedHdr]
GO
/****** Object:  StoredProcedure [dbo].[sp_getPayRelatedHdr]    Script Date: 06/07/2012 18:22:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
exec sp_getPayRelatedHdr '8100043'
select * from HPTINS00

*/
-- drop procedure sp_getPayRelated 
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
/****** Object:  StoredProcedure [dbo].[sp_getPayRelatedDtl]    Script Date: 06/07/2012 18:22:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
exec sp_getPayRelated '8100043'
select * from HPTINS00

*/
-- drop procedure sp_getPayRelated 
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
/****** Object:  StoredProcedure [dbo].[SP_MAIL]    Script Date: 06/07/2012 18:22:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--EXEC SP_MAIL 'DS201206070014','admin','MrBoy-ASUS'

/*
SELECT 0 AS CHK
	 , CQTSTS
     , CQTRCD
     , CQTCSN
     , CQTEMA
     , CQTDLN
     , CQTONN
     , CQTADR
     , COUNT(CQTCSN) AS CCSN
     , CQTDEA
     , SUM(CQTCQA) AS CQA
     , CQTDNO
FROM CQDT001 
GROUP BY CQTSTS, CQTRCD, CQTCSN, CQTEMA, CQTDLN, CQTONN, CQTADR, CQTDEA, CQTDNO
ORDER BY CQTRCD,CQTCSN

*/

CREATE PROCEDURE [dbo].[SP_MAIL] @DNO VARCHAR(15),@User VARCHAR(20),@Work VARCHAR(60)
AS
BEGIN
	DECLARE @BSD DATETIME
	DECLARE @RFN VARCHAR(15)
	DECLARE @CSN VARCHAR(7)
	DECLARE @EMA VARCHAR(255)
	DECLARE @DLN VARCHAR(255)
	DECLARE @ONN VARCHAR(255)
	DECLARE @ADR VARCHAR(255)
	DECLARE @BNK VARCHAR(3)
	DECLARE @BBR VARCHAR(4)
	DECLARE @CNO VARCHAR(7)
	DECLARE @DTE DATETIME
	DECLARE @AMT DECIMAL(18,2)
	DECLARE @CUS VARCHAR(20)
	DECLARE @SUN DECIMAL(18,2)
	DECLARE @SUO DECIMAL(18,2)
	DECLARE @DEA VARCHAR(10)
	DECLARE @CCC INT
	
	DECLARE CURSOR1 CURSOR FOR

		SELECT A.CQMBSD
			  ,B.CQSRFN
			  ,C.CQSCSN
			  ,E.ADREMA
			  ,F.DEA1NAME AS DLN
			  ,F.CUSNAME AS ONN
			  ,F.ADRAD12 + F.ADRAD34POST AS ADR
			  ,G.CQMBNK
			  ,G.CQMBBR
			  ,G.CQMCNO
			  ,G.CQMDTE
			  ,G.CQMAMT 
			  ,D.CONCUS 
			  ,C.SUMN
			  ,C.SUMO 
			  ,D.CONDEA   
		FROM CQDM005 A
		LEFT JOIN CQDS001 B ON A.CQMDNO=B.CQSDNO
		LEFT JOIN (SELECT CQSDNO,CQSCSN,SUM(SUMO) AS SUMO,SUM(SUMN) AS SUMN
				   FROM (SELECT CQSDNO,CQSCSN,CASE WHEN CQSRCT='O' THEN CQSNET END AS SUMO,CASE WHEN CQSRCT='N' THEN CQSNET END AS SUMN 
						 FROM CQDS003 
						 GROUP BY CQSDNO,CQSCSN,CASE WHEN CQSRCT='O' THEN CQSNET END,CASE WHEN CQSRCT='N' THEN CQSNET END
						) AA
				   GROUP BY CQSDNO,CQSCSN) C ON B.CQSRFN=C.CQSDNO
		LEFT JOIN HPMCON00 D ON C.CQSCSN=D.CONRUN
		LEFT JOIN DBMADR00 E ON C.CQSCSN=E.ADRCON
		LEFT JOIN LHPPDTA.dbo.TMP_INFOCOLLECTION F ON C.CQSCSN=F.CONRUN
		LEFT JOIN CQDM007 G ON B.CQSRFN=G.CQMDNO
		WHERE B.CQSBTY='LS' 
		  AND (LTRIM(RTRIM(B.CQSETY))='' OR B.CQSETY IS NULL)
		  AND A.CQMDNO=@DNO
	  
	OPEN CURSOR1
	FETCH NEXT FROM CURSOR1 INTO @BSD,@RFN,@CSN,@EMA,@DLN,@ONN,@ADR,@BNK,@BBR,@CNO,@DTE,@AMT,@CUS,@SUN,@SUO,@DEA	
		WHILE @@FETCH_STATUS = 0  
		BEGIN 
		
			SELECT @CCC=COUNT(*) FROM CQDT001 WHERE CQTRFN=@RFN AND CQTRCD=@BSD AND CQTCSN=@CSN 
			
			IF @CCC = 0 
			BEGIN
				IF (RTRIM(LTRIM(@EMA))='') OR (@EMA IS NULL)
				BEGIN
					SET @EMA = (SELECT EMAIL FROM DB2..HLCT_APP.HLTC_C_ADDRESS WHERE CENTER_CODE=@CUS AND ADDR_TYPE=4) --
				END
							
				INSERT INTO CQDT001 (CQTACT,CQTSTS,CQTBRN,CQTPDM,CQTPDT,CQTRFN,CQTRCD,CQTCSN,CQTEMA,CQTDLN
									,CQTONN,CQTADR,CQTBNK,CQTBBR,CQTCQN,CQTCQD,CQTCQA,CQTETD,CQTETU,CQTETW
									,CQTCRD,CQTCRU,CQTCRW,CQTSUN,CQTSUO,CQTDEA,CQTCTC
									)
							 VALUES ('A','P','01','2','01',@RFN,@BSD,@CSN,@EMA,@DLN
									,@ONN,@ADR,@BNK,@BBR,@CNO,@DTE,@AMT,{FN NOW()},@User,@Work
									,{FN NOW()},@User,@Work,@SUN,@SUO,@DEA,@CUS
									)
			END
			FETCH NEXT FROM CURSOR1 INTO @BSD,@RFN,@CSN,@EMA,@DLN,@ONN,@ADR,@BNK,@BBR,@CNO,@DTE,@AMT,@CUS,@SUN,@SUO,@DEA	
		END	
	CLOSE CURSOR1  
	DEALLOCATE CURSOR1 	
END
GO
/****** Object:  StoredProcedure [dbo].[sp_getEmailRelated]    Script Date: 06/07/2012 18:22:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--exec sp_getEmailRelated '8100492'--'8100492'
--exec sp_getEmailRelated '8100666'
CREATE procedure [dbo].[sp_getEmailRelated] 
@ConNo varchar(10)  
as
begin
--declare @ConNo varchar(10)  
declare @email varchar(255)
declare @deaCode varchar(10)
declare @centercode varchar(15)
--set @ConNo='8100004'--'8100055';
-- get Dealer Code
--
select @deaCode=CONDEA,@centercode=CONCUS from HPMCON00 where CONRUN=@ConNo


select @email=a.ADREMA
from DBMADR00 a where  ADRCON=@ConNo and a.ADREMA is not null 

if (@email is null) 
begin	
	select  top 1 @email=a.ADREMA
		from DBMADR00 a where  ADRCSN=@centercode and a.ADREMA is not null 
end


if (@email is null) 
begin
	select @email=EMAIL from DB2..HLCT_APP.HLTC_C_ADDRESS where CENTER_CODE=@centercode and ADDR_TYPE=4
end


if object_id( 'tempdb..#temp0001' ) is not  null drop table #temp0001

/*	
select a.ADREMA as EMAIL,b.CONDEA,d.[DLR Name] as DEANAME,b.CONCUS
	into #temp0001	
	from DBMADR00 a  
	left join HPMCON00 b on a.ADRCON=b.CONRUN	
	left join DEALER d on b.CONDEA= d.Code
where 	
	a.ADREMA is not null 
	and a.ADREMA=@email
	and ltrim(rtrim(@email))<>''
group by 
	a.ADREMA,b.CONDEA,b.CONCUS,d.[DLR Name]		
	
*/	
	
/*******************************************/	

declare @DEAGRP  varchar(20)
declare @GRPCDE  varchar(20)

--set @DEAGRP='SMH'

select @DEAGRP=CONDEA from HPMCON00 where CONRUN=@ConNo

if exists(
	select CQMGRP from CQDM014 where CQMDEA=@DEAGRP
) 
begin

	select top 1 @GRPCDE=CQMGRP from CQDM014 where CQMDEA=@DEAGRP

	select isnull(a.ADREMA,'No-EMail') as EMAIL,b.CONDEA,d.[DLR Name] as DEANAME,b.CONCUS 
	into #temp0001	
	from HPMCON00 b 
	left join DBMADR00 a on b.CONRUN=a.ADRCON
	left join DEALER d on b.CONDEA= d.Code
	where exists(
		select CQMDEA from CQDM014 where b.CONDEA=CQMDEA and CQMGRP=@GRPCDE
	)
	and a.ADREMA is not null
	group by 
	a.ADREMA,b.CONDEA,b.CONCUS,d.[DLR Name]		
	
	order by a.ADREMA,b.CONDEA,b.CONCUS,d.[DLR Name]	
		
end else
begin


	select a.ADREMA as EMAIL,b.CONDEA,d.[DLR Name] as DEANAME,b.CONCUS
		into #temp2222	
		from DBMADR00 a  
		left join HPMCON00 b on a.ADRCON=b.CONRUN	
		left join DEALER d on b.CONDEA= d.Code
	where 	
		a.ADREMA is not null 
	and a.ADREMA=@email
	and ltrim(rtrim(@email))<>''
	group by 
	a.ADREMA,b.CONDEA,b.CONCUS,d.[DLR Name]	
	
			
end	
	
	
/*******************************************/		
	 
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
						select @_email as EMAIL,a.CONDEA as CONDEA ,@_deaname as DEANAME,a.CONCUS as CONCUS,
							b.INSCRN,MIN(INSITM) INSITM	
						into #temp0002
						from HPMCON00 a  					
						left join HPTINS00 b on a.CONRUN = b.INSCRN and INSF11=3
						where a.CONDEA=@_condea
						and exists(
							select INSCRN from HPTINS00 where INSCRN=a.CONRUN and INSF11=3 
						)
						group by b.INSCRN,a.CONDEA,a.CONCUS
						order by b.INSCRN
					end else 
					begin
						insert #temp0002
						select @_email as EMAIL,a.CONDEA as CONDEA ,@_deaname as DEANAME ,a.CONCUS as CONCUS,
							b.INSCRN,MIN(INSITM) INSITM	
						from HPMCON00 a  
						left join HPTINS00 b on a.CONRUN = b.INSCRN and INSF11=3 
						where a.CONDEA=@_condea
						and exists(
							select INSCRN from HPTINS00 where INSCRN=a.CONRUN and INSF11=3 
						)
						group by b.INSCRN,a.CONDEA,a.CONCUS
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
	select '' as EMAIL,'' as CONDEA,'' as DEANAME,'' as CONCUS
end



/*
	select 0 as CHK,
	a.* from HPTINS00 a
	where a.INSCRN='A'	
*/
GO
/****** Object:  StoredProcedure [dbo].[sp_getEmailRelatedDtl]    Script Date: 06/07/2012 18:22:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--exec sp_getEmailRelatedDtl '8100492'
--exec sp_getEmailRelatedDtl '8100055'


CREATE procedure [dbo].[sp_getEmailRelatedDtl] 
	@ConNo varchar(10)  
as
begin

--declare @ConNo varchar(10)  
declare @email varchar(255)
declare @deaCode varchar(10)
declare @Taxrate decimal(18,0)
declare @centercode varchar(15)
--set @ConNo='8100004'--'8100055';
-- get Dealer Code
--

declare @DeaTBL  TABLE
(   
   EMAIL varchar(200),
   CONDEA varchar(20),
  -- DEANAME varchar(200),
   CONCUS int
)
   


select @deaCode=CONDEA,@centercode=CONCUS from HPMCON00 where CONRUN=@ConNo
select @Taxrate=CQMVA1 from CQDM008 where CQMCDE='WHT_RATE'



select @email=a.ADREMA
from DBMADR00 a where  ADRCON=@ConNo and a.ADREMA is not null 


if (@email is null) 
begin	
	select  top 1 @email=a.ADREMA
		from DBMADR00 a where  ADRCSN=@centercode and a.ADREMA is not null 
end


if (@email is null) 
begin
	select @email=EMAIL from DB2..HLCT_APP.HLTC_C_ADDRESS where CENTER_CODE=@centercode and ADDR_TYPE=4
end


if object_id( 'tempdb..#temp0001' ) is not  null drop table #temp0001

/*
select a.ADREMA as EMAIL,b.CONDEA,b.CONCUS
	into #temp0001	
	from DBMADR00 a  
	left join HPMCON00 b on a.ADRCON=b.CONRUN
where 	
	a.ADREMA is not null 
	and a.ADREMA=@email
group by 
	a.ADREMA,b.CONDEA,b.CONCUS	
		
*/	

/*******************************************/	

declare @DEAGRP  varchar(20)
declare @GRPCDE  varchar(20)

--set @DEAGRP='SMH'

select @DEAGRP=CONDEA from HPMCON00 where CONRUN=@ConNo

if exists(
	select CQMGRP from CQDM014 where CQMDEA=@DEAGRP
) 
begin

	select top 1 @GRPCDE=CQMGRP from CQDM014 where CQMDEA=@DEAGRP

	insert into @DeaTBL
	select isnull(a.ADREMA,'No-EMail') as EMAIL,b.CONDEA,b.CONCUS 
	--into #temp0001	
	from HPMCON00 b 
	left join DBMADR00 a on b.CONRUN=a.ADRCON
	left join DEALER d on b.CONDEA= d.Code
	where exists(
		select CQMDEA from CQDM014 where b.CONDEA=CQMDEA and CQMGRP=@GRPCDE
	)
	
	and a.ADREMA is not null
	
	
	group by 
	a.ADREMA,b.CONDEA,b.CONCUS,d.[DLR Name]	
		
	
	order by a.ADREMA,b.CONDEA,b.CONCUS
		
end else
begin

	insert into @DeaTBL
	select a.ADREMA as EMAIL,b.CONDEA,b.CONCUS
		--into #temp0001	
		from DBMADR00 a  
		left join HPMCON00 b on a.ADRCON=b.CONRUN
	where 	
		a.ADREMA is not null 
		and a.ADREMA=@email
	group by 
		a.ADREMA,b.CONDEA,b.CONCUS	
	
	
			
end	


--select * from @DeaTBL

--return 0
/*******************************************/	
	 
			--select * from #temp0001 a 

			declare @_email varchar(255)
			declare @_condea varchar(4)
			declare @_concus varchar(4)
			declare @rowcount int
			
			set @rowcount=0
			
			if object_id( 'tempdb..#temp0002' ) is not  null drop table #temp0002



			declare  c1 cursor for 
					select EMAIL,CONDEA,CONCUS from @DeaTBL a 
			open c1
			fetch  next from c1 into @_email,@_condea,@_concus
			while @@fetch_status=0 
			begin
					--print @_email
					if @rowcount=0 
					begin
						select @_email as EMAIL,a.CONDEA as CONDEA ,a.CONCUS as CONCUS,
							b.INSCRN,MIN(INSITM) INSITM	
						into #temp0002
						from HPMCON00 a  
						left join HPTINS00 b on a.CONRUN = b.INSCRN and INSF11=3 
						where a.CONDEA=@_condea
						and exists(
							select INSCRN from HPTINS00 where INSCRN=a.CONRUN and INSF11=3 
						)
						group by b.INSCRN,a.CONDEA,a.CONCUS
						order by b.INSCRN
					end else 
					begin
						insert #temp0002						
						select @_email as EMAIL,a.CONDEA as CONDEA ,a.CONCUS as CONCUS,
							b.INSCRN,MIN(INSITM) INSITM	
						from HPMCON00 a  
						left join HPTINS00 b on a.CONRUN = b.INSCRN and INSF11=3 
						where a.CONDEA=@_condea
						and exists(
							select INSCRN from HPTINS00 where INSCRN=a.CONRUN and INSF11=3 
						)
						group by b.INSCRN,a.CONDEA,a.CONCUS
						order by b.INSCRN					
					end
					
					set @rowcount=@rowcount+1

				fetch  next from c1 into @_email,@_condea,@_concus
			end

			close c1
			deallocate c1


--select * from #temp0002

--return 0

if object_id( 'tempdb..#temp0002' ) is not  null 
begin
	select 0 as CHK,a.*,b.*,e.CARMDL ,c.CONPER,
		case 
			when c.CONPER<36 then ((b.INSIAM*@Taxrate)/100) else 0
		end as WHT 
	,
		case 
			when c.CONPER<36 then (b.INSIAM-((b.INSIAM*@Taxrate)/100)+b.INSVAM) else (INSIAM+INSVAM)
		end as NET 		
	
	from #temp0002 a
	left join HPTINS00 b on a.INSCRN=b.INSCRN and a.INSITM=b.INSITM 
	left join DBMCOA03 d on b.INSCRN=d.COARUN 
	left join DBMCAR00 e on d.CARNUM=e.CARNUM	
	left join (
		select CONPER,CONRUN from HPMCON00 
		group by CONRUN,CONPER
	) as c on a.INSCRN=c.CONRUN 
	where a.EMAIL <>'No-EMail'
		--left join HPMCON00 c on a.INSCRN=c.CONRUN    -- exec sp_getEmailRelatedDtl '8100001'
		
	order by a.CONCUS
end else
	select 0 as CHK,
	a.* from HPTINS00 a
	where a.INSCRN='A'	
end
GO
/****** Object:  StoredProcedure [dbo].[sp_RCBatchIU]    Script Date: 06/07/2012 18:22:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
delete from HPTRCB00
delete from HPTRCH00
delete from HPTRCD00
*/


-- exec sp_RCBatchIU '201201205090058'
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
	select * from HPTRCH00 where RCHDOC=@NEWDOCNO--RCHRFN = @CNO and RCHBBN=@BNK and RCHBBR=@BBR
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



	insert into HPTRCB00   --RCB
	select 
		CQMACT,'2' as CQMPST,null as CQMPSD
		,'2' as CQMFL1,'2' as CQMFL2,'I' as  CQMFL3,CQMBRN,CQMPDM,CQMPDT
		,@NEWDOCNO as CQMDNO1,@RTM as CQMTNO,CQMETD
		,CQMETU,'2' as CQMDCT,abs(convert(decimal(18,2),CQMAMT)) as CQMAMT,CQMETD,CQMETD,CQMETU,CQMMTD,CQMMTD,CQMMTU
	from CQDM007 
	where CQMDNO=@DNO and CQMACT='A'	



	insert into HPTRCH00   --RCH
	
	select

	a.CQMACT,'2' as CQMPST,null as CQMPSD,'2' as CQMFL1,'2' as CQMFL2
	,'I' as  CQMFL3,a.CQMBRN,a.CQMPDM,a.CQMPDT,@NEWDOCNO as CQMDNO,'00' as CQMITM
	,'1' as CQMRBY,a.CQMBNK,a.CQMBBR,a.CQMCNO,CQMDTE,abs(convert(decimal(18,2),a.CQMAMT)) as CQMAMT,'01' as CQMACN,
	--c.CQMNAE as  CQMCQP
	'' as  CQMCQP
	,b.CQMSTS as CQMCQT,a.CQMETD,a.CQMETD,a.CQMETU,a.CQMMTD,a.CQMMTD,a.CQMMTU
		
	from CQDM007 a
	left join CQDM011 b on a.CQMCNO=b.CQMNO2
	left join CQDM002 c on b.CQMSTS=c.CQMCDE  -- master chq code
	where a.CQMDNO=@DNO
	and a.CQMACT='A'
	
	




	
	if object_id( 'tempdb..#temp0011' ) is not  null drop table #temp0011
	select identity(int,1,1) as ROWSEQ,* 
	
	into #temp0011
	from (
	
	
	select 
	'A' as CQSACT,'2' as CQMPST,null as CQMPSD,'D' as CQMFL1,'' as CQMFL2,null as CQMFL3
	,CQSBRN,CQSPDM,CQSPDT,@NEWDOCNO as CQMDNO
	,'00' as CQSITM,1 as CQSSEQ
	,'01' as CQSCBN,'2' as CQSCPM,'01' as CQSCPT
	,CQSCSN,'013' as CQSRTY,abs(convert(decimal(18,2),(CQSAMT+CQSVAT))) as CQSAMT -- amount
	,'1' as CQSRFR,'1' as CQSRTO
	,CQSETD as RCDETD,CQSETD as RCDETM ,CQSETU as RCDUET
	,CQSMTD as RCDMTD,CQSMTD as RCDMTM,CQSMTU as RCDUTM
	,null as CQSREF
	,0 as CQSICA
	from CQDS003 where  CQSDNO=@DNO and CQSRCT='N'
	/*
	union
	select 
	'A' as CQSACT,'2' as CQMPST,null as CQMPSD,'D' as CQMFL1,'' as CQMFL2,null as CQMFL3
	,CQSBRN,CQSPDM,CQSPDT,@NEWDOCNO as CQMDNO
	,'00' as CQSITM,2 as CQSSEQ
	,'01' as CQSCBN,'2' as CQSCPM,'01' as CQSCPT
	,CQSCSN,'094' as CQSRTY,CQSVAT -- amount
	,'1' as CQSRFR,'1' as CQSRTO
	,CQSETD as RCDETD,CQSETD as RCDETM ,CQSETU as RCDUET
	,CQSMTD as RCDMTD,CQSMTD as RCDMTM,CQSMTU as RCDUTM
	,null as CQSREF
	,0 as CQSICA
	from CQDS003 where  CQSDNO=@DNO and CQSRCT='N'	
	*/
		
	union
	select 
	'A' as CQSACT,'2' as CQMPST,null as CQMPSD,'D' as CQMFL1,'' as CQMFL2,null as CQMFL3
	,CQSBRN,CQSPDM,CQSPDT,@NEWDOCNO as CQMDNO
	,'00' as CQSITM,3 as CQSSEQ
	,'01' as CQSCBN,'2' as CQSCPM,'01' as CQSCPT
	,CQSCSN,'F81' as CQSRTY,abs(convert (decimal(18,2),CQSWHT)) as CQSWHT -- amount
	,'1' as CQSRFR,'1' as CQSRTO
	,CQSETD as RCDETD,CQSETD as RCDETM ,CQSETU as RCDUET
	,CQSMTD as RCDMTD,CQSMTD as RCDMTM,CQSMTU as RCDUTM
	,null as CQSREF
	,0 as CQSICA
	from CQDS003 where  CQSDNO=@DNO and CQSRCT='N'	 and CQSWHT<>0
	
	union
	select 
	'A' as CQSACT,'2' as CQMPST,null as CQMPSD,'D' as CQMFL1,'' as CQMFL2,null as CQMFL3
	,CQSBRN,CQSPDM,CQSPDT,@NEWDOCNO as CQMDNO
	,'00' as CQSITM,4 as CQSSEQ
	,'01' as CQSCBN,'2' as CQSCPM,'01' as CQSCPT
	,CQSCSN,CQSRS1 as CQSRTY,abs(convert(decimal(18,2),CQSNET)) CQSNET -- amount
	,'1' as CQSRFR,'1' as CQSRTO
	,CQSETD as RCDETD,CQSETD as RCDETM ,CQSETU as RCDUET
	,CQSMTD as RCDMTD,CQSMTD as RCDMTM,CQSMTU as RCDUTM
	,null as CQSREF
	,0 as CQSICA
	from CQDS003 where  CQSDNO=@DNO and CQSRCT='O' and CQSNET<>0	
	
	) as xx
	
	
    insert into HPTRCD00
	/*select 
		*
	from 
	#temp0011    
    */
    
	select 
		CQSACT,CQMPST,CQMPSD,CQMFL1,CQMFL2,CQMFL3,CQSBRN,CQSPDM,CQSPDT,CQMDNO,CQSITM,ROWSEQ,CQSCBN,CQSCPM,
		CQSCPT,CQSCSN,CQSRTY,CQSAMT,CQSRFR,CQSRTO,RCDETD,RCDETM,RCDUET,RCDMTD,RCDMTM,RCDUTM,CQSREF,CQSICA	
	from 
	#temp0011


end
GO
/****** Object:  UserDefinedFunction [dbo].[fn_GetChqPayment]    Script Date: 06/07/2012 18:23:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--select * from fn_GetChqPayment('8100595',DEFAULT) 
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

declare @WTRate decimal(18,2)
declare @WTPd decimal(18,2)


select @WTRate=CQMVA1 from CQDM008 where CQMCDE='WHT_RATE'
select @WTPd=CQMNM1 from CQDM008 where CQMCDE='WHT_PEROID'


if @WTRate is null 	set @WTRate=5

if @WTPd is null set @WTPd=36	

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
					(( convert(decimal(18,2),a.CQSAMT)+ convert(decimal(18,2),a.CQSVAT)) - convert(decimal(18,2),a.CQSWHT)) 				
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
		 when b.CONPER<=@WTPd then ((@WTRate*a.INSIAM )/100)  --((5*(a.INSIAM + a.INSVAM))/100) 
		 else 0 
		 end WHT
		,
		case 
		 when b.CONPER<=@WTPd then  (a.INSIAM + a.INSVAM) - convert(decimal(18,2),(@WTRate*(a.INSIAM))/100) 
		else (a.INSIAM + a.INSVAM)
		end
		as INSNET
	,isnull((
		select 
			case 
			when c.CONPER<=@WTPd then (SUM((b.INSIAM+b.INSVAM) - convert(decimal(18,2),(@WTRate*(b.INSIAM))/100)  ))
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
/****** Object:  UserDefinedFunction [dbo].[FN_CalcuGoods]    Script Date: 06/07/2012 18:23:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[FN_CalcuGoods] (@GOODS DECIMAL (18,2),@CONTRACT VARCHAR (8))
RETURNS @CALCU TABLE 
(
	GOODS DECIMAL(18,2),
	VAT DECIMAL(18,2),
	WHT DECIMAL(18,2),
	NET DECIMAL(18,2)
)
AS
BEGIN
DECLARE @VAT DECIMAL(18,2)
DECLARE @WHT DECIMAL(18,2)
DECLARE @NET DECIMAL(18,2)

SET @VAT = (@GOODS * (SELECT CQMVA1 FROM CQDM008 WHERE CQMABR='PREFERENCE' AND CQMGRP='PREFERENCE' AND CQMCDE='VAT_RATE'))/100 
SET @WHT = (( @GOODS * (SELECT TOP 1 CASE WHEN CONPER <= 36 THEN 
											(SELECT CQMVA1 FROM CQDM008 WHERE CQMABR='PREFERENCE' AND CQMGRP='PREFERENCE' AND CQMCDE='WHT_RATE')
						                  ELSE
											0
									 END
					    FROM HPMCON00 WHERE CONRUN=@CONTRACT))/100) 
SET @NET = ((@GOODS + @VAT) - @WHT)

INSERT INTO @CALCU SELECT @GOODS,@VAT,@WHT,@NET
RETURN
END
GO
/****** Object:  UserDefinedFunction [dbo].[fn_getInsPeriod]    Script Date: 06/07/2012 18:23:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--exec sp_getInsPeriod '8100002',26418.00
--exec sp_getInsPeriod '8100250',19795.00
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
/****** Object:  StoredProcedure [dbo].[SP_RUNNINGDOC]    Script Date: 06/07/2012 18:22:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--EXEC SP_RUNNINGDOC 'MAS','MASTERCHQ','MASTERCHQ'

CREATE PROCEDURE [dbo].[SP_RUNNINGDOC] 
	@PREFIX VARCHAR(10),
	@ABR VARCHAR(20),
	@CDE VARCHAR (20),
	@DOCNO VARCHAR(15) OUTPUT
AS
BEGIN
	DECLARE @DOC VARCHAR(15)
	DECLARE @NM1 DECIMAL(8,0)
	DECLARE @VA1 VARCHAR(100)
	DECLARE @CCC INT

	DECLARE @RUNNING DECIMAL(8,0)
	DECLARE @TODAY VARCHAR(8)

	SELECT @CCC=COUNT(*) FROM CQDM008 WHERE CQMABR=@ABR AND CQMGRP='RUNNING' AND CQMCDE=@CDE

	IF @CCC > 0 
	BEGIN
		SET @TODAY = CONVERT(VARCHAR,{FN NOW()},112)
		SELECT @NM1=ISNULL(CQMNM1,0), @VA1=ISNULL(CQMVA1,'') FROM CQDM008 WHERE CQMABR=@ABR AND CQMGRP='RUNNING' AND CQMCDE=@CDE
		
		IF @VA1=@TODAY
			SET @RUNNING = @NM1 + 1
		ELSE
			SET @RUNNING = 1
			
		UPDATE CQDM008 SET CQMNM1=@RUNNING, CQMVA1=@TODAY WHERE CQMABR=@ABR AND CQMGRP='RUNNING' AND CQMCDE=@CDE
			
		SET @DOC = @PREFIX + @TODAY + RIGHT('0000' + CAST(@RUNNING AS VARCHAR),4)
	END
	
	--SELECT @DOC AS DOCNO
	SET @DOCNO = @DOC
END
GO
/****** Object:  StoredProcedure [dbo].[SP_PROCESSRESULT]    Script Date: 06/07/2012 18:22:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
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
/****** Object:  StoredProcedure [dbo].[SP_RESTORERECEIVE]    Script Date: 06/07/2012 18:22:59 ******/
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
CREATE PROCEDURE [dbo].[SP_RESTORERECEIVE]									 
AS
BEGIN
	DECLARE @RFN VARCHAR(15)
  
	DECLARE CR1 CURSOR FOR
	SELECT CQMDNO FROM CQDM007 A 
	WHERE NOT EXISTS (SELECT CQMRFN FROM CQDM011 B WHERE B.CQMRFN=A.CQMDNO) 
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
/****** Object:  StoredProcedure [dbo].[SP_PAYDUE]    Script Date: 06/07/2012 18:22:58 ******/
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
/****** Object:  StoredProcedure [dbo].[SP_UPDATERECEIVE]    Script Date: 06/07/2012 18:22:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
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
		@EXPECDATE datetime,
		@ACCOUNTNUM  VARCHAR (10)
AS
BEGIN
		
	DECLARE @PAT CHAR (2)
	SELECT  @PAT = RIGHT(('00' + CAST(BACPAT AS VARCHAR)),2) FROM DBMBAC00 WHERE BACBAC=@ACCOUNTNUM
	
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
				CQMDFG='R',
				CQMPAT=@PAT
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
			   ,[CQMPAT]
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
			   ,@PAT
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
/****** Object:  StoredProcedure [dbo].[SP_GETHISTORY]    Script Date: 06/07/2012 18:22:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--EXEC SP_GETHISTORY '8100169'

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
/****** Object:  UserDefinedFunction [dbo].[fn_GetChqPaymentByDue]    Script Date: 06/07/2012 18:23:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--select * from fn_GetChqPaymentByDue('8100053',5)

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
/****** Object:  StoredProcedure [dbo].[sp_getInsPeriod]    Script Date: 06/07/2012 18:22:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--exec sp_getInsPeriod '8100053',36210
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
/****** Object:  StoredProcedure [dbo].[SP_NETAMT]    Script Date: 06/07/2012 18:22:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================

CREATE PROCEDURE [dbo].[SP_NETAMT]
	@DT DATETIME,
	@CON varchar(7),
	@NET decimal(18,2)	OUTPUT,
	@NET2 decimal(18,2) OUTPUT,
	@PA1 decimal(18,2)	OUTPUT,
	@GOODS decimal(18,2)OUTPUT,
	@VAT decimal(18,2)	OUTPUT,
	@WT decimal(18,2)	OUTPUT
AS
BEGIN
	
/*set @DT='2011-11-30'
set @CON='8100053'*/
declare @NETAMT2 decimal(18,2)
select @NETAMT2=((INSIAM + ((INSIAM * 7)/100)) - (INSIAM * (
				select case when CONPER <= 36 then 
							(SELECT CQMVA1  FROM CQDM008 
							 where CQMABR='PREFERENCE' 
							   and CQMGRP='PREFERENCE'
							   and CQMCDE='WHT_RATE')
					   else
							0
					   end
				from HPMCON00 where CONRUN=@CON)
														  )/100)
from HPTINS00 where year(INSDUE)=YEAR(@DT) and month(INSDUE)=month(@DT) and INSCRN=@CON

IF OBJECT_ID( 'TEMPDB..#XXXXX' ) IS NOT NULL DROP TABLE #XXXXX


select *
/*
,((NETAMT * 7)/100) AS VAT,((NETAMT * (
				select case when CONPER <= 36 then 
							(SELECT CQMVA1  FROM CQDM008 
							 where CQMABR='PREFERENCE' 
							   and CQMGRP='PREFERENCE'
							   and CQMCDE='WHT_RATE')
					   else
							0
					   end
				from HPMCON00 where CONRUN=@CON)
														  )/100) AS WT
		,
		
		((NETAMT + ((NETAMT * 7)/100)) - 
			(
				NETAMT * 
				(
					select case when CONPER <= 36 then 
								(
									SELECT CQMVA1  FROM CQDM008 
									where CQMABR='PREFERENCE' 
										and CQMGRP='PREFERENCE'
										and CQMCDE='WHT_RATE'
								   )
						   else
								0
						   end
					from HPMCON00 where CONRUN=@CON
				)
														  
			)/100) as netamt3 
			
			
														  
			*/											  														  
into #XXXXX
from (
select 
	a.INSCRN
   ,sum(a.INSIAM)as  INSIAM
   ,sum(a.INSIRA) as INSIRA
   ,sum(a.INSVAM) as INSVAM
   ,sum(a.INSVRA) as INSVRA
   ,sum(aa.CQSAMT)as CQSAMT
   ,sum(aa.CQSVAT)as  CQSVAT
   ,sum(aa.CQSWHT) as CQSWHT
   ,sum(aa.CQSNET) as CQSNET
   ,(sum(isnull(aa.CQSAMT,0))+ sum(isnull(a.INSIRA,0))-(sum(isnull(a.INSIAM,0)))) as NETAMT
	--,sum(a.INSIAM)-(sum(isnull(aa.CQSNET,0))-(sum(isnull(a.INSIAM,0)))) as  NET	
   ,@NETAMT2 as  NETAMT2	
	from HPTINS00 a		
	left join 
	(
		select b.*,c.* from  CQDM007 b
		left join CQDS003 c on b.CQMDNO=c.CQSDNO
		where
		c.CQSRCT='N'
	) aa on a.INSCRN=aa.CQSCSN and 
	 --a.INSDUE<=aa.CQMDTE 	
	MONTH(a.INSDUE)=month(aa.CQMDTE) 
	AND YEAR(a.INSDUE)=YEAR(aa.CQMDTE)
	
	--where a.INSCRN=@CON And a.INSDUE<@DT 
	--where a.INSCRN=@CON And YEAR(a.INSDUE)< YEAR(@DT) 
	--OR a.INSCRN=@CON AND  YEAR(a.INSDUE)= YEAR(@DT) AND MONTH(A.INSDUE) <= MONTH(@DT) 
	
	group by 
	a.INSCRN
	) as TB1
	
	select * from #XXXXX
	
	/*
	
	declare @CC int
	declare @PA decimal(18,2)
	select @cc=count(*) 
	from CQDM007 A
	LEFT JOIN CQDS003 B ON A.CQMDNO=B.CQSDNO
	where month(A.CQMDTE) = MONTH(@dt) 
	  and YEAR(A.cqmdte)=YEAR(@dt)
	  AND B.CQSCSN=@CON
	if @CC > 0
	begin
		SET @PA = 0
		select @PA=NETAMT3 from #XXXXX where NETAMT>=0
		UPDATE #XXXXX SET NETAMT3=0 WHERE @PA <> 0	
	end
	else
	begin
		select @PA=netamt2+netamt3 from #XXXXX
	end
	
	
	/****************/
	SELECT  * FROM #XXXXX
	
	
	select @NET=ABS(netamt3)
	      ,@NET2=NETAMT2
	      ,@PA1=@PA 
	      ,@GOODS=ABS(NETAMT)
	      ,@VAT=ABS(VAT)
	      ,@WT=ABS(WT)
	from #XXXXX
	select @NET,@NET2,@PA1,@GOODS,@VAT,@WT
	
	*/
END
GO
/****** Object:  StoredProcedure [dbo].[SP_ALERT]    Script Date: 06/07/2012 18:22:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- EXEC SP_ALERT
CREATE PROCEDURE [dbo].[SP_ALERT]
AS
BEGIN

	DECLARE @NOW DATETIME
	DECLARE @TIM INT
	SET @NOW = {FN NOW()}
	SET @TIM = 25

	IF OBJECT_ID( 'TEMPDB..#ALERT' ) IS NOT NULL DROP TABLE #ALERT

	SELECT * 
	INTO #ALERT 
	FROM (
	SELECT MAX(CQTCQD) AS CQTCQD
		 , MAX(CQTRFN) AS CQTRFN
		 , CQTCSN
		 , CQTDLN
		 , CQTONN
		 , CQTADR
		 , CQTEMA
		 , 0 AS ITEMS
		 , {FN NOW()} AS DUE
		 , CAST(0.00 AS DECIMAL(18,2)) AS AMT
		 , CQTDEA
	FROM CQDT001 A
	LEFT JOIN CQDM011 B ON A.CQTCQN=B.CQMNO2 AND A.CQTCQD=B.CQMDAT AND A.CQTCQA=B.CQMAMT
	WHERE DATEDIFF(DAY,CQTRCD,CQTCQD) >= 30  
	  AND B.CQMACT = 'A' AND B.CQMSTS = 'A' 
	GROUP BY CQTCSN, CQTDLN, CQTONN, CQTADR, CQTEMA, CQTDEA
	) AA 
	WHERE DATEDIFF(DAY,@NOW,CQTCQD) <= @TIM
	  AND DATEDIFF(DAY,@NOW,CQTCQD) >= 0
		
		DECLARE @CQD DATETIME
		DECLARE @FRN VARCHAR(15)
		DECLARE @CSN VARCHAR(7)
		
		DECLARE @MITM INT
		DECLARE @ITM INT
		DECLARE @DUE DATETIME
		DECLARE @IAM DECIMAL(18,2)
		
		DECLARE @NET DECIMAL(18,2)
		DECLARE @NETDUE DECIMAL(18,2)
		DECLARE @PA DECIMAL(18,2)
		DECLARE @GOODS DECIMAL(18,2)
		DECLARE @VAT DECIMAL(18,2)
		DECLARE @WHT DECIMAL(18,2)

		DECLARE CURSOR1 CURSOR FOR 

			SELECT CQTCQD,CQTRFN,CQTCSN FROM #ALERT
		
		OPEN CURSOR1  
		FETCH NEXT FROM CURSOR1 INTO @CQD,@FRN,@CSN 
		WHILE @@FETCH_STATUS = 0  
		BEGIN
			SET @MITM = (SELECT MAX(INSITM) FROM HPTINS00 WHERE INSCRN=@CSN)
			SET @ITM = (SELECT TOP 1 INSITM FROM HPTINS00 WHERE INSCRN=@CSN AND INSIRA<INSIAM AND MONTH(INSDUE)=MONTH(@CQD) AND YEAR(INSDUE)=YEAR(@CQD) ORDER BY INSITM)
			SELECT @DUE=INSDUE,@IAM=INSIAM FROM HPTINS00 WHERE INSCRN=@CSN AND INSITM=@ITM
			EXEC SP_PAYDUE @DUE,@CSN,@NET OUTPUT,@NETDUE OUTPUT,@PA OUTPUT,@GOODS OUTPUT,@VAT OUTPUT,@WHT OUTPUT
			
			
			WHILE (@GOODS = 0 AND @ITM < @MITM) OR (@GOODS > (@IAM * 2)) OR (@ITM > @MITM) OR (@ITM IS NULL)
			BEGIN
				IF (@GOODS = 0 AND @ITM < @MITM)
				BEGIN
					SET @ITM = @ITM + 1
					SELECT @DUE=INSDUE,@IAM=INSIAM FROM HPTINS00 WHERE INSCRN=@CSN AND INSITM=@ITM
				END
				ELSE IF (@GOODS > (@IAM * 2)) OR (@ITM > @MITM)  
				BEGIN
					SET @ITM = @ITM - 1
					SELECT @DUE=INSDUE,@IAM=INSIAM FROM HPTINS00 WHERE INSCRN=@CSN AND INSITM=@ITM
				END
				ELSE IF (@ITM IS NULL)
				BEGIN
					SET @ITM = @MITM
					SET @DUE = @CQD
					SET @IAM = (SELECT (CONINA-CONINV) FROM HPMCON00 WHERE CONRUN=@CSN)	
					--SELECT @DUE=INSDUE,@IAM=INSIAM FROM HPTINS00 WHERE INSCRN=@CSN AND INSITM=@ITM		
				END
				EXEC SP_PAYDUE @DUE,@CSN,@NET OUTPUT,@NETDUE OUTPUT,@PA OUTPUT,@GOODS OUTPUT,@VAT OUTPUT,@WHT OUTPUT		
			END
			 
			
			IF @GOODS >= @IAM
			BEGIN
				SET @ITM = @ITM -1
				SELECT @DUE=INSDUE,@IAM=INSIAM FROM HPTINS00 WHERE INSCRN=@CSN AND INSITM=@ITM	
			END
			
			UPDATE #ALERT SET ITEMS=@ITM,DUE=@DUE,AMT=@NETDUE WHERE CQTCQD=@CQD AND CQTRFN=@FRN AND CQTCSN=@CSN 
					
			FETCH NEXT FROM CURSOR1 INTO @CQD,@FRN,@CSN
		END 
		CLOSE CURSOR1  
		DEALLOCATE CURSOR1 		
		
		SELECT 0 AS CHK, 'P' AS CQTSTS, NULL AS CQTDNO ,* 
		FROM #ALERT A 
		WHERE NOT EXISTS (
				SELECT B.CQTCQD,B.CQTRFN,B.CQTCSN 
				FROM CQDT003 B 
				WHERE A.CQTCQD=B.CQTCQD 
				  AND A.CQTRFN=B.CQTRFN 
				  AND A.CQTCSN=B.CQTCSN )
		UNION 
		
		SELECT 0 AS CHK
		     , CQTSTS
		     , CQTDNO
		     , CQTCQD		     
		     , CQTRFN
		     , CQTCSN
		     , CQTDLN
		     , CQTONN
		     , CQTADR
		     , CQTEMA
		     , CQTITM
		     , CQTDUE
		     , CQTDAM
		     , CQTDEA
		FROM CQDT003
END

--EXEC SP_ALERT

INSERT [dbo].[CQDM008] ([CQMACT], [CQMSTS], [CQMABR], [CQMGRP], [CQMCDE], [CQMNME], [CQMDES], [CQMVA1], [CQMVA2], [CQMVA3], [CQMVA4], [CQMVA5], [CQMNM1], [CQMNM2], [CQMNM3], [CQMNM4], [CQMNM5], [CQMETD], [CQMETW], [CQMETU], [CQMMTD], [CQMMTU], [CQMMTW]) VALUES (N'A', N'A', N'MALERT', N'RUNNING', N'MALERT', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'')
INSERT [dbo].[CQDM008] ([CQMACT], [CQMSTS], [CQMABR], [CQMGRP], [CQMCDE], [CQMNME], [CQMDES], [CQMVA1], [CQMVA2], [CQMVA3], [CQMVA4], [CQMVA5], [CQMNM1], [CQMNM2], [CQMNM3], [CQMNM4], [CQMNM5], [CQMETD], [CQMETW], [CQMETU], [CQMMTD], [CQMMTU], [CQMMTW]) VALUES (N'A', N'A', N'MRECEIVE', N'RUNNING', N'MRECEIVE', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'')
GO
/****** Object:  StoredProcedure [dbo].[sp_getContractRelated]    Script Date: 06/07/2012 18:22:57 ******/
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
/****** Object:  StoredProcedure [dbo].[SP_SEARCHACCOUNTNUMBER]    Script Date: 06/07/2012 18:22:59 ******/
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
/****** Object:  StoredProcedure [dbo].[SP_SEARCHDEALERSCODE]    Script Date: 06/07/2012 18:22:59 ******/
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
/****** Object:  StoredProcedure [dbo].[SP_PROCESSDEPOSIT]    Script Date: 06/07/2012 18:22:58 ******/
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
	DECLARE @CNO VARCHAR (14)
	SELECT @ACT = CQMACT,@CST=(CQMACT + CQMSTS),@CNO=CQMCNO FROM CQDM011 
	WHERE CQMNO2 = @CHEQUENUM
	  AND CQMDAT = @CHEQUEDATE
	  AND CQMBNK = @BANK
	  AND CQMBBR = @BANKBRANCH
	  AND CQMAMT = @NETAMOUNT	
--	  AND CQMCNO = @COLNO
	IF @ACT <> '' OR @ACT IS NOT NULL
		BEGIN
			IF @CNO=@COLNO
				BEGIN
					SET @ETY = 'EDC'
					SET @RMK = 'DUPLICATE'	
				END
			ELSE
				BEGIN
					UPDATE CQDM011 SET CQMCNO=@COLNO WHERE CQMCNO=@CNO and CQMNO2=@CHEQUENUM and CQMDAT=@CHEQUEDATE
					SET @ETY = 'EDC'
					SET @RMK = 'DUPLICATE CHANGE COLLECTION NO'
				END			
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
/****** Object:  StoredProcedure [dbo].[SP_UPDATEMASTERCHEQUE]    Script Date: 06/07/2012 18:22:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
EXEC SP_UPDATEMASTERCHEQUE 
	'201201206050092'
   ,'admin'
   ,'BOY'
   ,'01'
   ,'2'
   ,'01'
   ,'A'
   ,'00'
   ,'04/10/2012'
   ,'5125474014'
   ,'20000000000004'
   ,'04/10/2012'

*/

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
	@COLNO VARCHAR (14),
	@STATUSDATE DATETIME
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
	
	DECLARE @NEWDOC VARCHAR(15)
	
	SELECT  @PAT = RIGHT(('00' + CAST(BACPAT AS VARCHAR)),2) FROM DBMBAC00 WHERE BACBAC=@ACCOUNTNUM
		
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
		SELECT @CHECKCOUNT=COUNT(*), @NEWDOC=CQMDNO FROM CQDM011
		WHERE CQMNO2=@CQ_NO
		AND	  CQMDAT=@CQ_DATE
		AND	  CQMAMT=@CQ_AMOUNT
		AND	  CQMBNK=@CQ_BNK_C
		AND	  CQMBBR=@CQ_BRR_C
		AND	  CQMACC=@CQ_ACCOUNT
		AND	  CQMCTY=@CQ_C_TYPE
		AND   CQMCNO=@COLNO
		--AND	  CQMACT='A'
		GROUP BY CQMDNO
		
		
		IF @CHECKCOUNT>0
			BEGIN
				UPDATE CQDM011 SET
				CQMACT='A',
				CQMSTS=@CHEQUESTATUS,
				CQMCCQ=@RESONCODE,
				CQMMTD={FN NOW()},
				CQMMTU=@USER,
				CQMMTW=@WORK,
				CQMSTD=@STATUSDATE
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
				EXEC SP_RUNNINGDOC 'MAS','MASTERCHQ','MASTERCHQ',@NEWDOC OUTPUT
				INSERT INTO CQDM011
				   ([CQMACT]
				   ,[CQMSTS]
				   ,[CQMBRN]
				   ,[CQMPDM]
				   ,[CQMPDT]
				   ,[CQMDNO]
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
				   ,[CQMETD]
				   ,[CQMETU]
				   ,[CQMETW]
				   ,[CQMCRD]
				   ,[CQMCRU]
				   ,[CQMCRW])
				VALUES
				   ('A'
				   ,@CHEQUESTATUS
				   ,@BRN
				   ,@PDM
				   ,@PDT
				   ,@NEWDOC
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
				   ,@STATUSDATE
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
				   ,{FN NOW()}
				   ,@USER
				   ,@WORK
				   ,{FN NOW()}
				   ,@USER
				   ,@WORK
				   )	
			END
		
		IF OBJECT_ID( 'TEMPDB..#UPDATEMASTERCHEQUE' ) IS NOT NULL DROP TABLE #UPDATEMASTERCHEQUE
		SELECT * INTO #UPDATEMASTERCHEQUE FROM CQDM011 WHERE CQMDNO=@NEWDOC
		DECLARE @MTD DATETIME
		DECLARE @MTU VARCHAR(20)
		DECLARE @MTW VARCHAR(100)
		SELECT @MTD=ISNULL(CQMMTD,CQMETD),@MTU=ISNULL(CQMMTU,CQMETU),@MTW=ISNULL(CQMMTW,CQMETW) FROM #UPDATEMASTERCHEQUE	
		UPDATE #UPDATEMASTERCHEQUE SET CQMETD=@MTD
		                              ,CQMETU=@MTU
		                              ,CQMETW=@MTW
		                              ,CQMCRD=@MTD
		                              ,CQMCRU=@MTU
		                              ,CQMCRW=@MTW
		                              ,CQMMTD=NULL
		                              ,CQMMTU=NULL
		                              ,CQMMTW=NULL
		
		INSERT INTO CQDT002 
			SELECT * 
				 , (SELECT ISNULL(MAX(CQTRNO),0) + 1 FROM CQDT002 WHERE CQTDNO=@NEWDOC) 
			FROM #UPDATEMASTERCHEQUE 
					
		SET @N = @N + 1
	END
	EXEC SP_RCBATCHIU @DOCNO
END
GO

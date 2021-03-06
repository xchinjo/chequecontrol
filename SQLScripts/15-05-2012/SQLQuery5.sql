USE [LLSUDTA]
GO
/****** Object:  StoredProcedure [dbo].[sp_getEmailRelated]    Script Date: 05/15/2012 15:56:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--exec sp_getEmailRelated '8100462'
ALTER procedure [dbo].[sp_getEmailRelated] 
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
	select @email=EMAIL from DB2..HLCT_APP.HLTC_C_ADDRESS where CENTER_CODE=@centercode and ADDR_TYPE=4
end




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

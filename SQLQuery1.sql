select * from tbl_Dump_P1 order by Subjid
select * from tbl_Dump_P2
select * from tbl_Dump_P3
select * from tbl_Dump_P4
select * from tbl_Dump_P5
sp_help tbl_Dump_P1
sp_help tbl_Dump_P2
sp_help tbl_Dump_P3
sp_help tbl_Dump_P4
sp_help tbl_Dump_P5

/*	Count for tables */
Select count(*) from tbl_Dump_P1 Where Age_at_npexam between '12' and '15'
Select count(*) from tbl_Dump_P1 Where Age_at_npexam >=12 and
Age_at_IMGExam <=15
Select * from tbl_Dump_P1 Where Age_at_npexam >=12 and
Age_at_IMGExam <=15
order by Age_at_npexam desc

/*Gender selection*/
select Gender,
(Select count(*) from tbl_Dump_P1 P1 where FDH_5_Birth_by='Normal
vaginal birth' and P1.Gender = P3.Gender) as Normal,
(Select count(*) from tbl_Dump_P1 P2 where FDH_5_Birth_by='Cesarean
section' and P2.Gender = P3.Gender) as CSection
from tbl_Dump_P1 P3 group by Gender

Select Gender , FDH_Respondent_Relation , count(FDH_Respondent_Relation) cnt from tbl_Dump_P1
Where FDH_Respondent_Relation is not null
group by Gender , FDH_Respondent_Relation
Order by Gender

/* count FDH_Respondent_Relation starts from Bi */
Select count(*) from tbl_Dump_P1
where FDH_Respondent_Relation like 'Bi%'
Select count(*) from tbl_Dump_P1
where FDH_Respondent_Relation like '%Mother'
Select * from tbl_Dump_P1
where FDH_Respondent_Relation like '%Mother'

/*Aggregate functions */
select Max(PHX_substance_stims_1) MaxValue,
Min(PHX_substance_stims_1) MinValue from tbl_Dump_P5
where PHX_substance_stims_1 is not null
Select Max(age) MaxAge, Min(Age) MinAge from tbl_Dump_P5
Select Avg(age) from tbl_Dump_P5
Select convert(decimal(18,2),Avg(age)) from tbl_Dump_P5
Select Max(FDH_Guardian_1_edu) MaxEdu, Min(FDH_Guardian_1_edu)
MinEdu from tbl_Dump_P1

/*Updating the tables*/
Update tbl_Dump_P1 set FDH_40f_Alzheimers_M_Grandmo='Yes' where
Gender='F' and FDH_Respondent_Relation='Biological Mother'

Update tbl_Dump_P1 set FDH_40f_Alzheimers_M_Grandmo='Yes' where
Gender='F' and FDH_Respondent_Relation='Biological Mother'

Update tbl_Dump_P1 set FDH_40f_Alzheimers_M_Grandmo='No' where
Gender='M' and FDH_Respondent_Relation='Biological Father'

select * from tbl_Dump_P1 where Gender='F' and
FDH_Respondent_Relation='Biological Mother'

select * from tbl_Dump_P1 where Gender='M' and
FDH_Respondent_Relation='Biological Father'

/*Creating a view */
Create View VwDumpAudit AS
Select P1.SubJID, P1.Age_at_NpExam, P1.Age_At_IMGExam, P1.Gender,
P1.FDH_Res pondent_Relation, P1.FDH_Guardian_1_Relation,
P2.FDH_Highest_Education, P2.FDH_Highest_Occupation,
P2.FDH_40s_Brain_Cancer_Mother,P2.FDH_40s_Brain_Cancer_Father, P2.TBX_attention_score,
P2.TBX_dccs_score, P2.TBX_IBAM_set,P2.TBX_ibamt1,P2.TBX_ibamt2, P2.TBX_ibamt3,P2.TBX_ibamt4, P5.Age
from tbl_Dump_P1 P1 join tbl_Dump_P2 P2 on P1.SubJID=P2.SubjiD join
tbl_Dump_P5 P5 on P2.SubjID = P5.SubjID
Select * from VwDumpAudit

/* Updating it with a new column */
Update VwDumpAudit set FDH_Highest_Occupation = 7 where SubjID
='P0144'

/* Altering View with adding new columns */
ALTER View VwDumpAudit AS
Select P1.SubJID, P1.Age_at_NpExam, P1.Age_At_IMGExam, P1.Gender,
P1.FDH_Respondent_Relation, P1.FDH_Guardian_1_Relation,
P2.FDH_Highest_Education, P2. FDH_Highest_Occupation,
P2.FDH_40s_Brain_Cancer_Mother,
P2.FDH_40s_Brain_Cancer_Father, P2.TBX_attention_score,
P2.TBX_dccs_score, P2.TBX_IBAM_set,
P2.TBX_ibamt1,P2.TBX_ibamt2, P2.TBX_ibamt3,P2.TBX_ibamt4,
P2.PHX_ANX_TOTAL,P2 .PHX_ANX_PDI,P2.PHX_ANX_SADI,P2.PHX_ANX_SoPI,P2.P
HX_ANX_OCDI,P2.PHX_ANX_GADI,P2.PHX_ANX_TSDI,P2.PHX_ANX_SPSETI,
P2.PHX_ANX_SPBIITI,P2.PHX_ANX_SPATI,P2.PHX_DEP_TOTAL,P2.PHX_DEP_SCRE
EN,P2.PHX_IMP_TOTAL,P2.PHX_IMP_LKPREM,P2.PHX_IMP_NEGURG,
P2.PHX_IMP_SNSEEK,P 2.PHX_IMP_LKPERS,P2.PHX_IMP_POSURG,P2.PHX_IMP_LKP
REM_NSKI,P5.Age
from tbl_Dump_P1 P1 join tbl_Dump_P2 P2 on P1.SubJID=P2.SubjiD join
tbl_Dump_P5 P5 on P2.SubjID = P5.SubjID

Select min(TBX_attention_score) Mini, max(TBX_attention_score) Maxi
from VwDumpAudit

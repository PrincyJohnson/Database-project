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


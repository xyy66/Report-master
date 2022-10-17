package com.report.manage.dao.iface;

import java.util.List;

import com.css.base.BaseException;
import com.report.home.bean.Member;
import com.report.manage.bean.Matchapply;
import com.report.manage.bean.Matchinfo;

public interface MatchapplyDao {

    public List<Matchapply> selectMatchapplyList4Home(Matchapply matchapply)
            throws BaseException;

    public List<Matchapply> selectMatchresultList4Home(Matchapply matchapply)
            throws BaseException;

    public int selectMatchapplyAuditListSize(Matchapply matchapply)
            throws BaseException;

    public List<Matchapply> selectMatchapplyAuditList(Matchapply matchapply)
            throws BaseException;

    public int selectMatchapplyAuditList1Size(Matchapply matchapply)
            throws BaseException;

    public List<Matchapply> selectMatchapplyAuditList1(Matchapply matchapply)
            throws BaseException;

    public int selectMatchresultListSize(Matchapply matchapply)
            throws BaseException;

    public List<Matchapply> selectMatchresultList(Matchapply matchapply)
            throws BaseException;

    public int selectMatchresultList1Size(Matchapply matchapply)
            throws BaseException;

    public List<Matchapply> selectMatchresultList1(Matchapply matchapply)
            throws BaseException;

    public Matchapply selectMatchapply(int id) throws BaseException;

    public List<Matchinfo> selectMatchinfoList() throws BaseException;

    public List<Member> selectMemberList() throws BaseException;

    public void insertMatchapply(Matchapply matchapply) throws BaseException;

    public void updateMatchapply(Matchapply matchapply) throws BaseException;

    public void deleteMatchapply(int id) throws BaseException;

    public void updateMatchapplyState(Matchapply matchapply)
            throws BaseException;

    public int selectMatchresultCount(Matchapply matchapply)
            throws BaseException;

    public void insertMatchresult(Matchapply matchapply) throws BaseException;

    public void updateMatchresult(Matchapply matchapply) throws BaseException;

    public List<Matchapply> selectMatchapplyFileList(Matchapply matchapply)
            throws BaseException;

    public int selectMatchapplyListSize(Matchapply matchapply)
            throws BaseException;

    public List<Matchapply> selectMatchapplyList(Matchapply matchapply)
            throws BaseException;
}
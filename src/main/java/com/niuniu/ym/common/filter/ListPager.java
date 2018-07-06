package com.niuniu.ym.common.filter;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

/**
 * 分页对象类
 * 用于在页面上分页标签，或者分页查询数据
 * @author lqg
 */
public class ListPager implements Serializable{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1019411054071217659L;
	
	/**
	 * 当前页号
	 */
	private int pageNo;
	
	/**
	 * 每页行数
	 */
	private int pageSize = 10;
	
	/**
	 * 总行数
	 */
	private long totalRows = -1;
	
	private int totalPage;
	
	/**
	 * 当前页行数
	 */
	private int rows = -1;
	
	
	public ListPager() {

	}

	public ListPager(int pageNo, int pageSize) {
		this.pageNo = pageNo;
		this.pageSize = pageSize;
	}

	
	/**
	 * 构造PageBean对象。PageBean对象用于Pager TagLib。
	 * @param pageUrl 页上的URL。如果以“javascript:”开头，则自动将pageUrl识别为javascript代码。页号可以作为变量，以"{p}"替代
	 * @param showPageNum 在pager taglib中显示的页数
	 * @return PageBean对象，用于Pager Taglib。
	 */
	public PagerBean buildPagerBean( String pageUrl, int showPageNum ) 
	{
		//如果到最后一页的话
		if ( rows >=0 && rows < pageSize ) {
			totalRows = pageNo * pageSize + rows;
		}
		
		  PagerBean tagBean = new PagerBean();
		  
		  tagBean.setCurrentPage( String.valueOf(this.getPageNo()+1) );
		  tagBean.setTotalPage( String.valueOf(this.getTotalPage()) );
		  
		  //上一页地址及首页地址
		  if ( this.getPageNo()>0 ) {
			  tagBean.setFirstPage( composePageURL(pageUrl,0) );
			  tagBean.setPrevPage( composePageURL(pageUrl,this.getPageNo()-1) );
		  }
		  
		  //下一页地址及最后页地址
		  if ( totalRows > 0 ) {
			  if ( this.getPageNo() < this.getTotalPage() - 1 ) {
				  tagBean.setLastPage( composePageURL(pageUrl,this.getTotalPage()-1) );
				  tagBean.setNextPage( composePageURL(pageUrl,this.getPageNo()+1) );
			  }
		  }
		  else if ( totalRows == -1 ) {
			  if ( rows == pageSize || rows == -1 ) {
				  tagBean.setNextPage( composePageURL(pageUrl,this.getPageNo()+1) );
			  }
		  }
		  
		  int firstPage = this.getPageNo() - showPageNum/2;
		  if ( firstPage<0 ) firstPage = 0;
		  int lastPage = firstPage + showPageNum - 1;
		  if ( totalRows >= 0 ) {
			  if ( lastPage>=this.getTotalPage() ) lastPage = this.getTotalPage()-1;
		  }
		  
		  int k = lastPage - showPageNum + 1;
		  if (k<0) firstPage = 0;
		  else firstPage = k;
		  
		  String[] pages = new String[ lastPage-firstPage+1 ];
		  List pageList = new ArrayList( lastPage - firstPage + 1 );
		  
		  String url = null;
		  Page page = null;
		  
		  for ( int i=firstPage; i<=lastPage; i++ ) {
			  url = composePageURL(pageUrl,i);
			  page = new Page();
			  page.setPageNo( i );
			  page.setUrl( url );
			  page.setSelected( i==this.pageNo );
			  pageList.add( page );
			  
			  if ( url.startsWith("javascript:") ) {
				  pages[i-firstPage] = "<a href=\"#\" onclick=\"" + url + "\">";
			  }
			  else {
				  pages[i-firstPage] = "<a href=\"" + url + "\">";
			  }
			  
			  if ( i==this.getPageNo() ) {
				  pages[i-firstPage] += "<b>" + (i+1) + "</b></a>";
			  }
			  else {
				  pages[i-firstPage] += (i+1) + "</a>";
			  }
		  }
		  
		  tagBean.setPages( pages );
		  tagBean.setPageList( pageList );
		  
		  String inputName = generateInputName();
		  tagBean.setInputName( inputName );
		  tagBean.setGotoScript( composeGotoPageScript(pageUrl, inputName) );
		  
		  return tagBean;
	}
	
	
	/**
	 * 构造分页的URL。如果url中有“{p}”，则将之替换为pageNo；否则在URL中增加pageNo参数
	 * @param url 分页的URL
	 * @param pageNo 当前页号
	 * @return 分页的URL
	 */
	private String composePageURL( String url, int pageNo ) {
		String pageURL = null;
		if ( url.indexOf("{p}")>=0 ) {
			pageURL = url.replaceAll("\\{p\\}", String.valueOf(pageNo) ); 
		}
		else {
			  if ( url.indexOf("?")>=0 ) {
				  pageURL = url + "&pageNo=" + pageNo;
			  }
			  else {
				  pageURL = url + "?pageNo=" + pageNo;
			  }
		}
		return pageURL;
	}
	
	
	private String generateInputName() 
	{
		int r = (int) (Math.random() * 10000);
		return "gotoPageNo" + r;
	}
	
	
	private String composeGotoPageScript( String url, String inputName )
	{
		if ( url.startsWith("javascript:") ) {
			url = url.substring(11, url.length());
			if ( url.indexOf("'{p}'")>=0 ) {
				url = url.replaceAll( "'\\{p\\}'", "p" );
			}
			else {
				url = url.replaceAll( "\\{p\\}", "p" );
			}
			
			StringBuffer sb = new StringBuffer();
			sb.append("javascript:");
			sb.append( "var p=document.getElementById('"+inputName+"').value;" );
			sb.append( "if ( isNaN(p) || p<1 " );
			if ( totalRows >=0 ) {
				sb.append( "|| p>"+this.getTotalPage() );
			}
			sb.append( ") alert( '错误的页码!' );" );
			sb.append( "else {" );
			sb.append( "p = parseInt(p);p = p-1;" );
			sb.append( url );
			sb.append( "}" );
			return sb.toString();
		}
		else {
			StringBuffer sb = new StringBuffer();
			sb.append("javascript:");
			sb.append( "var p=document.getElementById('"+inputName+"').value;" );
//			sb.append( "if ( isNaN(p) || p<1 || p>"+this.getTotalPage()+") alert( '错误的页码!' );" );
			sb.append( "if ( isNaN(p) || p<1 " );
			if ( totalRows >=0 ) {
				sb.append( "|| p>"+this.getTotalPage() );
			}
			sb.append( ") alert( '错误的页码!' );" );
			sb.append( "else {" );
			sb.append( "p = parseInt(p);p = p-1;" );
			
			
			int pos = 0;
			if ( url.indexOf("{p}")>0 ) {
				while ( pos>=0 ) {
					pos = url.indexOf( "{p}" );
					if ( pos>=0 ) {
						if ( pos<url.length()-3 ) {
							url = url.replace( "{p}", "'+p+'" );
						}
						else {
							url = url.replace( "{p}", "'+p" );
						}
					}
				}
				sb.append( "window.location='" + url );
				if ( !url.endsWith("'+p") ) {
					sb.append( "'" );
				}
			}
			else {
				if ( url.indexOf("?")>0 ) {
					sb.append( "window.location='" + url + "' + '&pageNo='+p" );
				}
				else {
					sb.append( "window.location='" + url + "' + '?pageNo='+p" );
				}
			}
			
			sb.append(";}");
			return sb.toString();
		}
	}

	
	/**
	 * 得到当前页号
	 * @return
	 */
	public int getPageNo() {
		return pageNo;
	}

	/**
	 * 设置当前页号
	 * @param pageNo
	 */
	public void setPageNo(int pageNo) {
		this.pageNo = pageNo;
	}

	/**
	 * 得到每页多少行
	 * @return
	 */
	public int getPageSize() {
		return pageSize;
	}

	/**
	 * 设置每页多少行
	 * @param pageSize
	 */
	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}
	
	/**
	 * 得到总共多少行
	 * @return
	 */
	public long getTotalRows() {
		return totalRows;
	}

	/**
	 * 设置总共多少行
	 * @param totalRows
	 */
	public void setTotalRows(long totalRows) {
		this.totalRows = totalRows;
	}

	
	/**
	 * 得到总共多少页
	 * @return
	 */
	public int getTotalPage() {
		if ( totalRows == -1 ){
			totalPage = 0;
		}else{
			totalPage = (int) Math.ceil( (double)totalRows / pageSize );
		}
		return totalPage;
	}

	/**
	 * 得到当前页行数
	 * @return
	 */
	public int getRows() {
		if(pageNo < 0){
			pageNo = 0;
		}
		rows = pageSize * pageNo;
		return rows;
	}

	/**
	 * 设置当前页行数
	 * @param rows
	 */
	public void setRows(int rows) {
		this.rows = rows;
	}

}


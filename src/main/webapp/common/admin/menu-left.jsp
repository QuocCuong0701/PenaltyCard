<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>

<!-- Sidebar -->
<div class="sidebar sidebar-style-2">
    <div class="sidebar-wrapper scrollbar scrollbar-inner">
        <div class="sidebar-content">
            <div class="user">
                <div class="avatar-sm float-left mr-2">
                    <img src="<c:url value="/template/admin/img/profile.jpg"/>" alt="..." class="avatar-img rounded-circle">
                </div>
                <div class="info">
                    <a data-toggle="collapse" href="#collapseExample" aria-expanded="true">
								<span>
									${USERMODEL.user_name}
									<span class="user-level">Quản Trị Viên</span>
									<span class="caret"></span>
								</span>
                    </a>
                    <div class="clearfix"></div>

                    <div class="collapse in" id="collapseExample">
                        <ul class="nav">
                            <li>
                                <a href="#profile">
                                    <span class="link-collapse">My Profile</span>
                                </a>
                            </li>
                            <li>
                                <a href="#edit">
                                    <span class="link-collapse">Edit Profile</span>
                                </a>
                            </li>
                            <li>
                                <a href="#settings">
                                    <span class="link-collapse">Settings</span>
                                </a>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
            <ul class="nav nav-primary">
                <li class="nav-item active">
                    <a data-toggle="collapse" href="<c:url value="/admin-home"/>" class="collapsed" aria-expanded="false">
                        <i class="fas fa-home"></i>
                        <p>Bảng điều khiển</p>
                    </a>
                </li>
                <li class="nav-section">
							<span class="sidebar-mini-icon">
								<i class="fa fa-ellipsis-h"></i>
							</span>
                    <h4 class="text-section">Chức Năng</h4>
                </li>
                <li class="nav-item">
                    <a href="<c:url value="/admin-product?type=list"/>">
                        <i class="fas fa-box-open"></i><p>Quản lí sản phẩm</p>
                    </a>
                </li>
                <li class="nav-item">
                    <a href="<c:url value="/admin-user?type=list"/>">
                        <i class="fas fa-users"></i><p>Quản lí người dùng</p>
                    </a>
                </li>
                <li class="nav-item">
                    <a href="<c:url value="/admin-bill?type=list"/>">
                        <i class="fas fa-file-alt"></i><p>Quản lí đơn hàng</p>
                    </a>
                </li>
            </ul>
        </div>
    </div>
</div>
<!-- End Sidebar -->
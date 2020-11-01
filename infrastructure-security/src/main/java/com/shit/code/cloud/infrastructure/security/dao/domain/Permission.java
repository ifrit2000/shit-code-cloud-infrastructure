package com.shit.code.cloud.infrastructure.security.dao.domain;

import com.baomidou.mybatisplus.annotation.TableName;
import com.shit.code.cloud.mybatis.entity.BaseEntity;
import lombok.Data;
import lombok.EqualsAndHashCode;
import org.hibernate.annotations.Table;

import javax.persistence.OneToMany;

/**
 * @author Anthony
 * @date 11/1/20
 **/
@EqualsAndHashCode(callSuper = true)
@Data
@TableName(schema = "security_db", value = "t_permission")
public class Permission extends BaseEntity {

    private String permissionName;

    private String permissionDesc;
}
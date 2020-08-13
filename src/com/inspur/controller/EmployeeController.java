package com.inspur.controller;

import com.inspur.bean.Department;
import com.inspur.bean.Employee;
import com.inspur.dao.DepartmentDao;
import com.inspur.dao.EmployeeDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.management.modelmbean.ModelMBeanOperationInfo;
import java.util.Collection;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @program: restful_crud
 * @description:
 * @author: hezhengsheng
 * @create: 2020-08-12 16:00
 **/
@Controller
public class EmployeeController {

    @Autowired
    EmployeeDao employeeDao;

    @Autowired
    DepartmentDao departmentDao;

    /**
     * 方法描述: 获取所有员工信息
     *
     * @return java.lang.String
     * @Author Hezs
     * @Date 16:49 2020/8/12
     * @Param [model]
     **/
    @RequestMapping("/emps")
    public String getAllEmps(Model model) {
        Collection<Employee> all = employeeDao.getAll();
        model.addAttribute("emps", all);
        return "list";
    }

    /**
     * 方法描述: 去员工添加页面，去页面之前需要查出所有部门信息，进行展示
     *
     * @return java.lang.String
     * @Author Hezs
     * @Date 16:51 2020/8/12
     * @Param []
     **/
    @RequestMapping("/toAddPage")
    public String toAddPage(Model model) {
        Collection<Department> all = departmentDao.getDepartments();
        model.addAttribute("depts", all);
        model.addAttribute("employee", new Employee());
        return "add";
    }

    /**
     * 方法描述: 保存员工信息
     *
     * @return java.lang.String
     * @Author Hezs
     * @Date 18:58 2020/8/12
     * @Param [employee]
     **/
    @RequestMapping(value = "emp", method = RequestMethod.POST)
    public String addEmp(Employee employee) {
        employeeDao.save(employee);
        return "redirect:/emps";
    }

    /**
     * 方法描述: 删除员工
     *
     * @return java.lang.String
     * @Author Hezs
     * @Date 9:45 2020/8/13
     * @Param [id]
     **/
    @RequestMapping(value = "/emp/{id}", method = RequestMethod.DELETE)
    public String deleteEmp(@PathVariable("id") Integer id) {
        System.out.println("passing...");
        employeeDao.delete(id);
        return "forward:/emps";
    }

//    @RequestMapping(value = "/emp/{id}", method = RequestMethod.GET)
//    public String deletemp(@PathVariable("id") Integer id) {
//        employeeDao.delete(id);
//        return "forward:/emps";
//    }

    /**
     * 方法描述: 来到修改页面
     *
     * @return java.lang.String
     * @Author Hezs
     * @Date 19:35 2020/8/12
     * @Param [id, model]
     **/
    @RequestMapping(value = "/emp/{id}", method = RequestMethod.GET)
    public String getEmp(@PathVariable("id") Integer id, Model model) {
        // 1、查出员工信息
        Employee employee = employeeDao.get(id);
        // 2、放在请求域中
        model.addAttribute("employee", employee);
        // 3、继续查出部门信息放在隐含模型中
        Collection<Department> departments = departmentDao.getDepartments();
        model.addAttribute("depts", departments);
        return "edit";
    }

    /**
     * 方法描述: 修改员工信息
     *
     * @return java.lang.String
     * @Author Hezs
     * @Date 20:24 2020/8/12
     * @Param [employee]
     **/
    @RequestMapping(value = "/emp/{id}", method = RequestMethod.PUT)
    public String updateEmp(@ModelAttribute("employee") Employee employee) {
        System.out.println("update:" + employee);
        employeeDao.save(employee);
        return "redirect:/emps";
    }

    /**
     * 方法描述: ModelAttribute
     *
     * @return void
     * @Author Hezs
     * @Date 20:24 2020/8/12
     * @Param [id, model]
     **/
    @ModelAttribute
    public void myModelAttribute(@RequestParam(value = "id", required = false) Integer id, Model model) {
        if (id != null) {//这里获取的id是这里提交的id
                         // <input type="hidden" name="id" value="${employee.id }"/>
            Employee employee = employeeDao.get(id);
            model.addAttribute("employee", employee);
        }
    }
}

/**
 * 系统权限接口
 */
export const systemRoleApi = {
  // 查询系统权限
  getById(id){
    return request({ url: '/systemRole/getById', method: 'get', params: { id } })
  },
  // 分页查询系统权限列表
  page(params){
    return request({ url: '/systemRole/page', method: 'get', params })
  },
  // 查询系统权限列表
  list(params){
    return request({ url: '/systemRole/list', method: 'get', params })
  },
  // 保存系统权限
  add(data){
    return request({ url: '/systemRole/add', method: 'post', data })
  },
  // 更新系统权限
  update(data){
    return request({ url: '/systemRole/update', method: 'post', data })
  },
  // 批量删除系统权限信息
  remove(data){
    return request({ url: '/systemRole/remove', method: 'delete', data })
  },
  // 导出系统权限
  exportData(data) {
    download('/systemRole/export', data, `系统权限_${getNowDate('_')}.xlsx`)
  },
  // 获取系统权限导入模板
  downloadTemplate() {
    downloadTemplate('/systemRole/downloadTemplate', `系统权限_模板_${getNowDate('_')}.xlsx`)
  },
  importUrl: '/systemRole/importData',
}

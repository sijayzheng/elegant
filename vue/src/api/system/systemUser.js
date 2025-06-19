/**
 * 系统用户接口
 */
export const systemUserApi = {
  // 查询系统用户
  getById(id){
    return request({ url: '/systemUser/getById', method: 'get', params: { id } })
  },
  // 分页查询系统用户列表
  page(params){
    return request({ url: '/systemUser/page', method: 'get', params })
  },
  // 查询系统用户列表
  list(params){
    return request({ url: '/systemUser/list', method: 'get', params })
  },
  // 保存系统用户
  add(data){
    return request({ url: '/systemUser/add', method: 'post', data })
  },
  // 更新系统用户
  update(data){
    return request({ url: '/systemUser/update', method: 'post', data })
  },
  // 批量删除系统用户信息
  remove(data){
    return request({ url: '/systemUser/remove', method: 'delete', data })
  },
  // 导出系统用户
  exportData(data) {
    download('/systemUser/export', data, `系统用户_${getNowDate('_')}.xlsx`)
  },
  // 获取系统用户导入模板
  downloadTemplate() {
    downloadTemplate('/systemUser/downloadTemplate', `系统用户_模板_${getNowDate('_')}.xlsx`)
  },
  importUrl: '/systemUser/importData',
}

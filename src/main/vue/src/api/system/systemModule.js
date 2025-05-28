/**
 * 系统模块接口
 */
export const systemModuleApi = {
  // 查询系统模块
  getById(id){
    return request({ url: '/systemModule/getById', method: 'get', params: { id } })
  },
  // 分页查询系统模块列表
  page(params){
    return request({ url: '/systemModule/page', method: 'get', params })
  },
  // 查询系统模块列表
  list(params){
    return request({ url: '/systemModule/list', method: 'get', params })
  },
  // 保存系统模块
  add(data){
    return request({ url: '/systemModule/add', method: 'post', data })
  },
  // 更新系统模块
  update(data){
    return request({ url: '/systemModule/update', method: 'post', data })
  },
  // 批量删除系统模块信息
  remove(data){
    return request({ url: '/systemModule/remove', method: 'delete', data })
  },
  // 导出系统模块
  exportData(data) {
    download('/systemModule/export', data, `系统模块_${getNowDate('_')}.xlsx`)
  },
  // 获取系统模块导入模板
  downloadTemplate() {
    downloadTemplate('/systemModule/downloadTemplate', `系统模块_模板_${getNowDate('_')}.xlsx`)
  },
  importUrl: '/systemModule/importData',
}

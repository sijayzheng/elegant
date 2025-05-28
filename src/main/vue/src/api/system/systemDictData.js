/**
 * 系统字典数据接口
 */
export const systemDictDataApi = {
  // 查询系统字典数据
  getById(id){
    return request({ url: '/systemDictData/getById', method: 'get', params: { id } })
  },
  // 分页查询系统字典数据列表
  page(params){
    return request({ url: '/systemDictData/page', method: 'get', params })
  },
  // 查询系统字典数据列表
  list(params){
    return request({ url: '/systemDictData/list', method: 'get', params })
  },
  // 保存系统字典数据
  add(data){
    return request({ url: '/systemDictData/add', method: 'post', data })
  },
  // 更新系统字典数据
  update(data){
    return request({ url: '/systemDictData/update', method: 'post', data })
  },
  // 批量删除系统字典数据信息
  remove(data){
    return request({ url: '/systemDictData/remove', method: 'delete', data })
  },
  // 导出系统字典数据
  exportData(data) {
    download('/systemDictData/export', data, `系统字典数据_${getNowDate('_')}.xlsx`)
  },
  // 获取系统字典数据导入模板
  downloadTemplate() {
    downloadTemplate('/systemDictData/downloadTemplate', `系统字典数据_模板_${getNowDate('_')}.xlsx`)
  },
  importUrl: '/systemDictData/importData',
}

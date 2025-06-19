/**
 * 用户头像接口
 */
export const systemUserAvatarApi = {
  // 查询用户头像
  getById(id){
    return request({ url: '/systemUserAvatar/getById', method: 'get', params: { id } })
  },
  // 分页查询用户头像列表
  page(params){
    return request({ url: '/systemUserAvatar/page', method: 'get', params })
  },
  // 查询用户头像列表
  list(params){
    return request({ url: '/systemUserAvatar/list', method: 'get', params })
  },
  // 保存用户头像
  add(data){
    return request({ url: '/systemUserAvatar/add', method: 'post', data })
  },
  // 更新用户头像
  update(data){
    return request({ url: '/systemUserAvatar/update', method: 'post', data })
  },
  // 批量删除用户头像信息
  remove(data){
    return request({ url: '/systemUserAvatar/remove', method: 'delete', data })
  },
  // 导出用户头像
  exportData(data) {
    download('/systemUserAvatar/export', data, `用户头像_${getNowDate('_')}.xlsx`)
  },
  // 获取用户头像导入模板
  downloadTemplate() {
    downloadTemplate('/systemUserAvatar/downloadTemplate', `用户头像_模板_${getNowDate('_')}.xlsx`)
  },
  importUrl: '/systemUserAvatar/importData',
}

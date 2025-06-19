import {formatNumber, parseTime} from '@/utils/index'

export const rowFormatter = {
  date: (row, column, value) => {
    return parseTime(value, '{y}-{m}-{d}')
  },
  zhDate: (row, column, value) => {
    return parseTime(value, '{y}年{m}月{d}日')
  },
  dateTime: (row, column, value) => {
    return parseTime(value, '{y}-{m}-{d} {h}:{i}:{s}')
  },
  zhDateTime: (row, column, value) => {
    return parseTime(value, '{y}年{m}月{d}日 {h}时{i}分{s}秒')
  },
  time: (row, column, value) => {
    return parseTime(value, '{y}-{m}-{d} {h}:{i}:{s}')
  },
  zhTime: (row, column, value) => {
    return parseTime(value, '{y}年{m}月{d}日 {h}时{i}分{s}秒')
  },
  number: (row, column, value) => {
    return formatNumber(value)
  },
  yuan: (row, column, value) => {
    return `${value}元`
  },
  wanYuan: (row, column, value) => {
    return `${value}万元`
  },
  percent: (row, column, value) => {
    return `${value}%`
  },
}

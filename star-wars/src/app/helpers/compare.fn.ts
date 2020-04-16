
type BasicValidType = number | string | Date

export function compare(a: BasicValidType , b: BasicValidType, isAsc: boolean) {
  return (a < b ? -1 : 1) * (isAsc ? 1 : -1);
}
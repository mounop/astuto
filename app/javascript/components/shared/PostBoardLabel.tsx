import * as React from 'react';

import IBoard from '../../interfaces/IBoard';

const PostBoardLabel = ({ name }: IBoard) => (
  <span className="badge badgeLight">{name}</span>
);

export default PostBoardLabel;